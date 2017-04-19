//
//  MySceneViewController.swift
//  Duel
//
//  Created by Jenna on 2/23/17.
//  Copyright © 2017 Jenna. All rights reserved.
//


import UIKit
import simd

class MySceneViewController: MessagesViewController, MessagesViewControllerDelegate {

    var worldModelMatrix:float4x4!
    var objectToDraw: Cube!
    
    let panSensivity:Float = 5.0
    var lastPanLocation: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worldModelMatrix = float4x4()
        worldModelMatrix.translate(0.0, y: 0.0, z: -4)
        worldModelMatrix.rotateAroundX(float4x4.degrees(toRad: 25), y: 0.0, z: 0.0)
        
        // pass in texture
        objectToDraw = Cube(device: device, commandQ: commandQueue, textureLoader: textureLoader, texture: "question")
        //objectToDraw.addCube(x: 0.0, y: 0, z: -2.0)
        self.messagesViewControllerDelegate = self
        
        setupGestures()
    }
    
    func initializeTexture(texture: String) {
        switch texture {
        case "fire":
            objectToDraw.changeTexture(resource: "fire", type: "jpeg", textureLoader: textureLoader)
        case "cube":
            objectToDraw.changeTexture(resource: "cube", type: "png", textureLoader: textureLoader)
        case "ivy":
            objectToDraw.changeTexture(resource: "ivy", type: "jpeg", textureLoader: textureLoader)
        case "rock":
            objectToDraw.changeTexture(resource: "rock", type: "jpeg", textureLoader: textureLoader)
        case "paper":
            objectToDraw.changeTexture(resource: "paper", type: "jpeg", textureLoader: textureLoader)
        case "scissors":
            objectToDraw.changeTexture(resource: "scissors", type: "jpeg", textureLoader: textureLoader)
        case "lost":
            objectToDraw.showGameResults(resource: "loser", type: "jpeg", textureLoader: textureLoader)
        case "won":
            objectToDraw.showGameResults(resource: "winner", type: "jpeg", textureLoader: textureLoader)
        case "questions":
            objectToDraw.showGameResults(resource: "questions", type: "png", textureLoader: textureLoader)
        default:
            objectToDraw.changeTexture(resource: "cube", type: "png", textureLoader: textureLoader)
        }
    }

    @IBAction func doubleTap(_ sender: Any) {
        currentMove = "rock"
        print("rock")
    }
    
    @IBAction func rotate(_ sender: Any) {
        currentMove = "lost"
    }
    
    @IBAction func pinch(_ sender: Any) {

        currentMove = "won"
    }
    
    @IBAction func tap(_ sender: Any) {
        currentMove = "paper"
        print("paper")
    }
    
    @IBAction func longPress(_ sender: Any) {
        currentMove = "scissors"
        print("scissors")
    }
    
    //MARK: - MetalViewControllerDelegate
    func renderObjects(_ drawable:CAMetalDrawable) {
        
        // check if gameState is nil
        if (gameState != nil) {
            initializeTexture(texture: currentMove)
        } else {
            initializeTexture(texture: currentMove)
        }
        objectToDraw.render(commandQueue, pipelineState: pipelineState, drawable: drawable, parentModelViewMatrix: worldModelMatrix, projectionMatrix: projectionMatrix, clearColor: nil)
    }
    
    func updateLogic(_ timeSinceLastUpdate: CFTimeInterval) {
        objectToDraw.updateWithDelta(timeSinceLastUpdate)
    }
    
    //MARK: - Gesture related
    func setupGestures() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(MySceneViewController.pan(_:)))
        self.view.addGestureRecognizer(pan)
    }
    
    func pan(_ panGesture: UIPanGestureRecognizer) {
        if panGesture.state == UIGestureRecognizerState.changed {
            let pointInView = panGesture.location(in: self.view)
            let xDelta = Float((lastPanLocation.x - pointInView.x)/self.view.bounds.width) * panSensivity
            let yDelta = Float((lastPanLocation.y - pointInView.y)/self.view.bounds.height) * panSensivity
            objectToDraw.rotationY -= xDelta
            objectToDraw.rotationX -= yDelta
            lastPanLocation = pointInView
        } else if panGesture.state == UIGestureRecognizerState.began {
            lastPanLocation = panGesture.location(in: self.view)
        }
    }
    
}

