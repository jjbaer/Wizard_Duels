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
        objectToDraw = Cube(device: device, commandQ: commandQueue, textureLoader: textureLoader, texture: "questions")
        self.messagesViewControllerDelegate = self
        
       // setupGestures()
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
        case "water":
            objectToDraw.changeTexture(resource: "water", type: "jpeg", textureLoader: textureLoader)
        default:
            objectToDraw.changeTexture(resource: "questions", type: "png", textureLoader: textureLoader)
        }
    }
    
    @IBAction func swipeRight(_ sender: Any) {
        //NOT YET IN GAME LOGIC
        //currentMove = "rock"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "")
        print("swipRight")
    }

    @IBAction func swipeLeft(_ sender: Any) {
        //NOT YET IN GAME LOGIC
        //currentMove = "rock"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "")
        print("swipLeft")
    }
    
    @IBAction func swipeDown(_ sender: Any) {
        //NOT YET IN GAME LOGIC
        //currentMove = "rock"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "")
        print("swipDown")
    }
    
    @IBAction func swipeUp(_ sender: Any) {
        //NOT YET IN GAME LOGIC
        //currentMove = "rock"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "")
        print("swipUp")
    }
    
    @IBAction func doubleTap(_ sender: Any) {
        //NOT YET IN GAME LOGIC
        //currentMove = "rock"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "")
        print("double tap")
    }
    
    @IBAction func rotate(_ sender: Any) {
        //NOT YET IN GAME LOGIC
        //currentMove = "rock"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "")
    }
    
    @IBAction func pinch(_ sender: Any) {
        currentMove = "water"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "sinWave")
        print("water")
        objectToDraw.renderSpell = true
    }
    
    @IBAction func tap(_ sender: Any) {
        currentMove = "fire"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "spin")
        print("fire")
        objectToDraw.renderSpell = true
    }
    
    @IBAction func longPress(_ sender: Any) {
        currentMove = "ivy"
        objectToDraw.moving = true
        objectToDraw.updateMotion(newMotion: "grow")
        print("ivy")
        objectToDraw.renderSpell = true
    }
    
    //MARK: - MetalViewControllerDelegate
    func renderObjects(_ drawable:CAMetalDrawable) {
        
        initializeTexture(texture: currentMove)

        objectToDraw.render(commandQueue, pipelineState: pipelineState, drawable: drawable, parentModelViewMatrix: worldModelMatrix, projectionMatrix: projectionMatrix, clearColor: nil)
        if (gameState != nil) {
            objectToDraw.changeTextureWitch(opponentMove: gameState.oponentMove, textureLoader: textureLoader)
        }
        if (objectToDraw.spellCast) {
            print("about to submit")
            submit()
            objectToDraw.spellCast = false
            objectToDraw.renderSpell = false
        }
    }
    
    //panning for viewing the whole room
    /*func setupGestures() {
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
    }  */
}

