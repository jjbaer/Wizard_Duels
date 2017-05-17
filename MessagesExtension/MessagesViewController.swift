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
        if let image = createImageForMessage(gameState: gameState), let conversation = activeConversation {
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
        
        dismiss()
    }
    
    @IBOutlet weak var heart1: UIImageView!
    @IBOutlet weak var heart2: UIImageView!

    @IBOutlet weak var heart3: UIImageView!
    
    @IBAction func mySpellsButtonPressed(_ sender: UIButton) {
        showMySpells()
    }
    
    func submit() {
        print("\n---IN SUBMIT--- \n")
        if (gameState == nil) {
            gameState = GameState(currentTexture: currentMove, currentPlayer: "1", p1Move: currentMove, p2Move: "Z", gameResult: "incomplete", round: 1, p1Health: "3", p2Health: "3", p1Round: "0", p2Round: "0")
        } else {
            gameState.currentTexture = currentMove
        }
        
        if (gameState.currentPlayer == "1") {
            gameState.p1Move = currentMove
        } else {
            gameState.p2Move = currentMove
        }
        
        print(gameState.determineResult())
        updateHealthImage()
        //tell user if they won or lost last game
        if (gameState.gameResult != "incomplete") {
            showAlertMsg(title: "Hey!", message: "You " + gameState.gameResult + "! Challenge them to another duel?")
        }
        //refresh other players last move to nothing for a new game
        if (gameState.currentPlayer == "1") {
            //refresh player 2s last move to nothing
            gameState.p2Move = "Z"
        }
        else {
            //refresh player 1s last move to nothing
            gameState.p1Move = "Z"
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
    
    func createImageForMessage(gameState: GameState) -> UIImage? {
        let background = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        background.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 75, y: 75, width: 150, height: 150))
        label.font = UIFont.systemFont(ofSize: 56.0)
        if (gameState.currentPlayer == "1") {
            label.backgroundColor = UIColor.red
            label.text = "P1"
        } else {
            label.backgroundColor = UIColor.blue
            label.text = "P2"
        }
        label.textColor = UIColor.white
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
        // suddenly it's back to 3
        print("\n---IN PREPARE--- \n")
        var urlComponents = URLComponents()
        urlComponents.scheme = "https";
        urlComponents.host = "www.wizardduels.com";
        
        if (gameState.currentPlayer == "1") {
            gameState.p1Move = currentMove
        } else {
            gameState.p2Move = currentMove
        }
        
        // current player
        let playerQuery = URLQueryItem(name: "currentPlayer",
                                       value: gameState.currentPlayer)
        urlComponents.queryItems = [playerQuery]
        
        // this player's move
        var p1Query: URLQueryItem
        p1Query = URLQueryItem(name: "p1Move",
                                            value: gameState.p1Move)
        var p2Query: URLQueryItem
        p2Query = URLQueryItem(name: "p2Move",
                                            value: gameState.p2Move)
        
        urlComponents.queryItems?.append(p1Query)
        urlComponents.queryItems?.append(p2Query)
        
        // Current Texture
        var currentTextureQuery: URLQueryItem
        currentTextureQuery = URLQueryItem(name: "currentTexture", value: gameState.currentTexture)
        urlComponents.queryItems?.append(currentTextureQuery)
        
        // Round
        var roundQuery: URLQueryItem
        gameState.round += 1
        roundQuery = URLQueryItem(name: "round", value: String(gameState.round))
        urlComponents.queryItems?.append(roundQuery)
        
        // result
        var resultQuery: URLQueryItem
        var result = gameState.gameResult
        if (result == "won") {
            result = "lost"
        } else if (result == "lost") {
            result = "won"
        }
        resultQuery = URLQueryItem(name: "result",
                                   value: result)
        urlComponents.queryItems?.append(resultQuery)
        
        // Health
        gameState.calculateHealth()
        var p1Health: URLQueryItem
        p1Health = URLQueryItem(name: "p1Health", value: gameState.p1Health)
        urlComponents.queryItems?.append(p1Health)
        var p2Health: URLQueryItem
        p2Health = URLQueryItem(name: "p2Health", value: gameState.p2Health)
        urlComponents.queryItems?.append(p2Health)
        
        // Round
        var p1Round: URLQueryItem
        p1Round = URLQueryItem(name: "p1Round", value: gameState.p1Round)
        urlComponents.queryItems?.append(p1Round)
        var p2Round: URLQueryItem
        p2Round = URLQueryItem(name: "p2Round", value: gameState.p2Round)
        urlComponents.queryItems?.append(p2Round)
        
        
        return urlComponents.url!
    }
    
    func decodeURL(_ url: URL) {
        print("\n---IN DECODE--- \n")

        let components = URLComponents(url: url,
                                       resolvingAgainstBaseURL: false)
        
        // default values
        var currentPlayer = "Z"
        var gameResult = "Z"
        var p1Move = "Z"
        var p2Move = "Z"
        var p1Health = "3"
        var p2Health = "3"
        var round = -1
        var p1Round = "0"
        var p2Round = "0"
        let currentTexture = "questions" // changed from var
        
        // decoding information about the games state as recieved from the other player
        for (_, queryItem) in (components?.queryItems?.enumerated())! {
            
            if queryItem.name == "currentPlayer" {
                currentPlayer = queryItem.value == "1" ? "2" : "1"
            }
            else if queryItem.name == "result" {
                gameResult = queryItem.value!
            }
            else if queryItem.name == "p1Move" {
                p1Move = queryItem.value!
            }
            else if queryItem.name == "p2Move" {
                p2Move = queryItem.value!
            } else if queryItem.name == "round" {
                round = Int(queryItem.value!)!
            } else if (queryItem.name == "p1Health") {
                p1Health = queryItem.value!
            } else if (queryItem.name == "p2Health") {
                p2Health = queryItem.value!
            } else if (queryItem.name == "p1Round") {
                p1Round = queryItem.value!
            } else if (queryItem.name == "p2Round") {
                p2Round = queryItem.value!
            }

        }
        
        // instantiate gameState
        gameState = GameState(currentTexture: currentTexture, currentPlayer: currentPlayer, p1Move: p1Move, p2Move: p2Move, gameResult: gameResult, round: round, p1Health: p1Health, p2Health: p2Health, p1Round: p1Round, p2Round: p2Round)
        currentMove = currentTexture
        
        updateHealthImage()
        
        // FOR TESTING / DEBUGGING ONLY
        debugPrintDecode(gameState: gameState)
        if (gameState.gameResult != "incomplete") {
            showAlertMsg(title: "Hey!", message: "You " + gameState.gameResult + " the last game! They challenged you to a new duel. Reply with another spell.")
        }
        
    }
    
    // Update Health Image
    func updateHealthImage() {
        if (gameState.currentPlayer == "1") {
            switch gameState.p1Health {
            case "3":
                break
            case "2":
                heart3.image = UIImage(named: "broken_heart.png")
            case "1":
                heart3.image = UIImage(named: "broken_heart.png")
                heart2.image = UIImage(named: "broken_heart.png")
            default:
                heart3.image = UIImage(named: "broken_heart.png")
                heart2.image = UIImage(named: "broken_heart.png")
                heart1.image = UIImage(named: "broken_heart.png")
            }
        } else {
            switch gameState.p2Health {
            case "3":
                break
            case "2":
                heart3.image = UIImage(named: "broken_heart.png")
            case "1":
                heart3.image = UIImage(named: "broken_heart.png")
                heart2.image = UIImage(named: "broken_heart.png")
            default:
                heart3.image = UIImage(named: "broken_heart.png")
                heart2.image = UIImage(named: "broken_heart.png")
                heart1.image = UIImage(named: "broken_heart.png")
            }
        }
    }
    
    func showAlertMsg(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel) { (action) in
            print("Alert was cancelled")
            alertController.dismiss(animated: false, completion: nil)
        }
        
        alertController.addAction(cancelAction)
    }
    
    @IBAction func howToDuelButton(_ sender: UIButton) {
        let alertController = UIAlertController(title: "How to Duel", message: "Welcome to Wizard Duels! Cast a spell by making a gesture on the screen at your opponent. Depending on how you wave your wand, different spells will be cast. Once you have waved your wand, hit the cast button to challenge your opponent. You can then send your spell at them, and they can respond with an opposing spell. They will see if they won or lost that round after they receive your spell and cast their own spell. They can then cast a another spell to challenge you to a another round. Once you recieve this new spell you will be able to see if you won or lost the previous round, and you can then also reply with a new spell for the new round.", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        let cancelAction = UIAlertAction(title: "Close", style: .cancel) { (action) in
            print("Alert was cancelled")
            alertController.dismiss(animated: false, completion: nil)
        }
        
        alertController.addAction(cancelAction)
    }
    
    func showMySpells() {
        let alertController = UIAlertController(title: "My Spells", message: "", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        //set up close button
        let cancelAction = UIAlertAction(title: "Close", style: .cancel) { (action) in
            alertController.dismiss(animated: false, completion: nil)
        }
        
        //set up water button
        let waterAction = UIAlertAction(title: "Water Jet", style: .default) { (action) in
            self.waterSpell()
        }
        
        //set up fire button
        let fireAction = UIAlertAction(title: "Fire Ball", style: .default) { (action) in
            self.fireSpell()
        }
        
        //set up ivy button
        let ivyAction = UIAlertAction(title: "Ivy Takeover", style: .default) { (action) in
            self.ivySpell()
        }
        
        alertController.addAction(waterAction)
        alertController.addAction(fireAction)
        alertController.addAction(ivyAction)
        alertController.addAction(cancelAction)
    }
    
    //this alert explains how to cast a water spell to the user
    func waterSpell() {
        let alertController = UIAlertController(title: "Water Jet", message: "Shoot a jet of water at your enemy by making a pinching motion with your wand. This spell will put out any fire.", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        //set up close button
        let cancelAction = UIAlertAction(title: "Back to My Spells", style: .cancel) { (action) in
            print("Alert was cancelled")
            alertController.dismiss(animated: false, completion: nil)
            self.showMySpells()
        }
        
        alertController.addAction(cancelAction)
    }
    
    //this alert explains how to cast a fire spell to the user
    func fireSpell() {
        let alertController = UIAlertController(title: "Fire Ball", message: "Throw a fire ball at your enemy. To do this you must jab your wand at them. Fire will burn through any plant spells and damage your opponent.", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        //set up close button
        let cancelAction = UIAlertAction(title: "Back to My Spells", style: .cancel) { (action) in
            print("Alert was cancelled")
            alertController.dismiss(animated: false, completion: nil)
            self.showMySpells()
        }
        
        alertController.addAction(cancelAction)
    }
    
    //this alert explains to the user how to cast the ivy spell
    func ivySpell() {
        let alertController = UIAlertController(title: "Ivy Takeover", message: "Cast ivy by holding your wand out in a long pressing motion towards your opponent. Plants will then take over and consume the castle room with other wizards in it. This spell is stronger when cast againt water, because the ivy will soak up the liquid and become bigger and stronger.", preferredStyle: .alert)
        self.present(alertController, animated: true, completion: nil)
        
        //set up close button
        let cancelAction = UIAlertAction(title: "Back to My Spells", style: .cancel) { (action) in
            print("Alert was cancelled")
            alertController.dismiss(animated: false, completion: nil)
            self.showMySpells()
        }
        
        alertController.addAction(cancelAction)
    }
    
    override func willBecomeActive(with conversation: MSConversation) {
        
        if let messageURL = conversation.selectedMessage?.url {
            decodeURL(messageURL)
            caption = "It's your move!"
            session = conversation.selectedMessage?.session
        }
    }
    
    private func debugPrintDecode(gameState: GameState) {
        
        print("-- DECODE GAMESTATE --")
        print("current player: " + gameState.currentPlayer)
        print("gameResult: " + gameState.gameResult)
        print("p1Move: " + gameState.p1Move)
        print("p2Move: " + gameState.p2Move)
        print("p1Health: " + gameState.p1Health)
        print("p2Health: " + gameState.p1Health)
        print("round: " + String(gameState.round))
        print("p1Round: " + gameState.p1Round)
        print("p2Round: " + gameState.p2Round)
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
