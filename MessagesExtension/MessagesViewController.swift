//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Jenna on 2/23/17.
//  Copyright © 2017 Jenna. All rights reserved.

import UIKit
import MetalKit
import QuartzCore
import simd
import Messages

protocol MessagesViewControllerDelegate : class {
    func updateLogic(_ timeSinceLastUpdate:CFTimeInterval)
    func renderObjects(_ drawable:CAMetalDrawable)
}

class MessagesViewController: MSMessagesAppViewController {
    var device: MTLDevice! = nil
    var pipelineState: MTLRenderPipelineState! = nil
    var commandQueue: MTLCommandQueue! = nil
    var projectionMatrix: float4x4!
    var textureLoader: MTKTextureLoader! = nil
    
    var gameStatus = [String](repeating: "-", count: 2)
    var caption = "Want to duel?"
    var session: MSSession?
    var gameState: GameState!
    var currentMove = "questions"
    
    @IBAction func didPressSend(_ sender: UIButton) {
        if let image = createImageForMessage(), let conversation = activeConversation {
            let layout = MSMessageTemplateLayout()
            layout.image = image
            layout.caption = caption
            
            let message = MSMessage()
            message.layout = layout
            message.url = prepareURL()
            
            conversation.insert(message, completionHandler: { (error: Error?) in
                print(error ?? "not an error")
            })
        }
    }
    
    @IBOutlet var mtk_view: MTKView! {
        didSet {
            mtk_view.delegate = self
            mtk_view.preferredFramesPerSecond = 60
            mtk_view.clearColor = MTLClearColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
        }
    }

    weak var messagesViewControllerDelegate:MessagesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        projectionMatrix = float4x4.makePerspectiveViewAngle(float4x4.degrees(toRad: 85.0), aspectRatio: Float(self.view.bounds.size.width / self.view.bounds.size.height), nearZ: 0.01, farZ: 100.0)
        
        
        device = MTLCreateSystemDefaultDevice()
        textureLoader = MTKTextureLoader(device: device)
        mtk_view.device = device
        commandQueue = device.makeCommandQueue()
        
        let defaultLibrary = device.newDefaultLibrary()
        let fragmentProgram = defaultLibrary!.makeFunction(name: "basic_fragment")
        let vertexProgram = defaultLibrary!.makeFunction(name: "basic_vertex")
        
        let pipelineStateDescriptor = MTLRenderPipelineDescriptor()
        pipelineStateDescriptor.vertexFunction = vertexProgram
        pipelineStateDescriptor.fragmentFunction = fragmentProgram
        pipelineStateDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        pipelineStateDescriptor.colorAttachments[0].isBlendingEnabled = true
        pipelineStateDescriptor.colorAttachments[0].rgbBlendOperation = MTLBlendOperation.add;
        pipelineStateDescriptor.colorAttachments[0].alphaBlendOperation = MTLBlendOperation.add;
        pipelineStateDescriptor.colorAttachments[0].sourceRGBBlendFactor = MTLBlendFactor.one;
        pipelineStateDescriptor.colorAttachments[0].sourceAlphaBlendFactor = MTLBlendFactor.one;
        pipelineStateDescriptor.colorAttachments[0].destinationRGBBlendFactor = MTLBlendFactor.oneMinusSourceAlpha;
        pipelineStateDescriptor.colorAttachments[0].destinationAlphaBlendFactor = MTLBlendFactor.oneMinusSourceAlpha;
        
        pipelineState = try! device.makeRenderPipelineState(descriptor: pipelineStateDescriptor)
    }
    
    func render(_ drawable: CAMetalDrawable?) {
        guard let drawable = drawable else { return }
        self.messagesViewControllerDelegate?.renderObjects(drawable)
    }
    
    func createImageForMessage() -> UIImage? {
        let background = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        background.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 75, y: 75, width: 150, height: 150))
        label.font = UIFont.systemFont(ofSize: 56.0)
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.white
        label.text = "Let's duel"
        label.textAlignment = .center
        label.layer.cornerRadius = label.frame.size.width/2.0
        label.clipsToBounds = true
        
        background.addSubview(label)
        background.frame.origin = CGPoint(x: view.frame.size.width, y: view.frame.size.height)
        view.addSubview(background)
        
        UIGraphicsBeginImageContextWithOptions(background.frame.size, false, UIScreen.main.scale)
        background.drawHierarchy(in: background.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        background.removeFromSuperview()
        
        return image
    }
    
    func prepareURL() -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https";
        urlComponents.host = "www.wizardduels.com";
        
        // current player
        let playerQuery = URLQueryItem(name: "currentPlayer",
                                       value: gameState.currentPlayer)
        urlComponents.queryItems = [playerQuery]
        
        // this player's move
        var moveQuery: URLQueryItem
        if gameState.currentPlayer == "X" {
            moveQuery = URLQueryItem(name: "xMove",
                                            value: gameState.p1Move)
        } else {
            moveQuery = URLQueryItem(name: "oMove",
                                            value: gameState.p2Move)
        }
        urlComponents.queryItems?.append(moveQuery)
        
        // result
        print(gameState.determineResult())
        var resultQuery: URLQueryItem
        resultQuery = URLQueryItem(name: "result",
                                   value: gameState.gameResult)
        urlComponents.queryItems?.append(resultQuery)
        // if the result is Z...then don't show a dialog
        
        // Current Texture
        var currentTextureQuery: URLQueryItem
        currentTextureQuery = URLQueryItem(name: "currentTexture", value: gameState.currentTexture)
        urlComponents.queryItems?.append(currentTextureQuery)
        
        // Round
        var roundQuery: URLQueryItem
        roundQuery = URLQueryItem(name: "round", value: String(gameState.round))
        urlComponents.queryItems?.append(roundQuery)
        
        
        return urlComponents.url!
    }
    
    func prepareMessage() {
        
        if session == nil {
            session = MSSession()
        }
        let message = MSMessage()
        
        let layout = MSMessageTemplateLayout()
        layout.caption = caption
        
        message.layout = layout
        message.url = prepareURL()
        
        let conversation = self.activeConversation
        
        conversation?.insert(message, completionHandler: {(error) in
            if let error = error {
                print(error)
            }
        })
        
        self.dismiss()
    }
    
    func decodeURL(_ url: URL) {

        let components = URLComponents(url: url,
                                       resolvingAgainstBaseURL: false)
        
        // default values
        var currentPlayer = "Z"
        var gameResult = "Z"
        var p1Move = "Z"
        var p2Move = "Z"
        var round = -1
        var currentTexture = "questions"
        
        // decoding information about the games state as recieved from the other player
        for (_, queryItem) in (components?.queryItems?.enumerated())! {
            
            if queryItem.name == "currentPlayer" {
                currentPlayer = queryItem.value == "X" ? "O" : "X"
            }
            else if queryItem.name == "gameResult" {
                gameResult = queryItem.value!
                print("gameResult: " + gameResult)
            }
            else if queryItem.name == "xMove" {
                p1Move = queryItem.value!
                print("xMove: " + p1Move)
            }
            else if queryItem.name == "oMove" {
                p2Move = queryItem.value!
                print("oMove: " + p2Move)
            } else if queryItem.name == "round" {
                round = Int(queryItem.value!)!
                print("round: " + String(round))
            } else {
                currentTexture = queryItem.value!
                print("current Texture: " + currentTexture)
            }
        }
        
        // instantiate gameState
        gameState = GameState(currentTexture: currentTexture, currentPlayer: currentPlayer, p1Move: p1Move, p2Move: p2Move, gameResult: gameResult, round: round)
        
    }
    
    override func willBecomeActive(with conversation: MSConversation) {
        
        if let messageURL = conversation.selectedMessage?.url {
            decodeURL(messageURL)
            caption = "It's your move!"
            session = conversation.selectedMessage?.session
        }
    }
}

// MARK: - MTKViewDelegate
extension MessagesViewController: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        projectionMatrix = float4x4.makePerspectiveViewAngle(float4x4.degrees(toRad: 85.0),
                                                             aspectRatio: Float(self.view.bounds.size.width / self.view.bounds.size.height),
                                                             nearZ: 0.01, farZ: 100.0)
    }
    
    func draw(in view: MTKView) {
        render(view.currentDrawable)
    }
}
