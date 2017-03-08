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
    var currentPlayer: String = "X"
    var session: MSSession?
    // TODO: pull out the string from the URL here
    var gameState = GameState(texture: "yo")
    var caption: String?
    
    @IBAction func didPressSend(_ sender: UIButton) {
        if let image = createImageForMessage(), let conversation = activeConversation {
            let layout = MSMessageTemplateLayout()
            layout.image = image
            layout.caption = caption
            
            let message = MSMessage()
            message.layout = layout
            message.url = URL(string: "emptyURL")
            
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
        let playerQuery = URLQueryItem(name: "currentPlayer",
                                       value: currentPlayer)
        
        urlComponents.queryItems = [playerQuery]
        let textureQuery = URLQueryItem(name: "currentTexture",
                                        value: gameState.currentTexture)
        
        urlComponents.queryItems?.append(textureQuery)
        
        return urlComponents.url!
    }
    
    // you changed this so it doesn't take in a URL, don't forget
    func prepareMessage() {
        
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
        
        for (index, queryItem) in (components?.queryItems?.enumerated())! {
            
            if queryItem.name == "currentPlayer" {
                currentPlayer = queryItem.value == "X" ? "O" : "X"
            } else if queryItem.name == "currentTexture" {
                gameState.currentTexture = queryItem.value!
            }
        }
    }
    
    // you deleted some stuff in here
    override func willBecomeActive(with conversation: MSConversation) {
        
        if let messageURL = conversation.selectedMessage?.url {
            decodeURL(messageURL)
            caption = "It's your move!"
        }
    }
}

// MARK: - MTKViewDelegate
extension MessagesViewController: MTKViewDelegate {
    
    // 1
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        projectionMatrix = float4x4.makePerspectiveViewAngle(float4x4.degrees(toRad: 85.0),
                                                             aspectRatio: Float(self.view.bounds.size.width / self.view.bounds.size.height),
                                                             nearZ: 0.01, farZ: 100.0)
    }
    
    // 2
    func draw(in view: MTKView) {
        render(view.currentDrawable)
    }
}
