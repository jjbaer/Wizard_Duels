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
    // pull out the string from the URL here
    var gameState = GameState(texture: "yo")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worldModelMatrix = float4x4()
        worldModelMatrix.translate(0.0, y: 0.0, z: -4)
        worldModelMatrix.rotateAroundX(float4x4.degrees(toRad: 25), y: 0.0, z: 0.0)
        
        objectToDraw = Cube(device: device, commandQ: commandQueue, textureLoader: textureLoader)
        objectToDraw = Cube(device: device, commandQ: commandQueue, textureLoader: textureLoader)
        objectToDraw.addCube(x: -2.0, y: 0, z: 0)
        objectToDraw.addCube(x: -1.0, y: 1.0, z: -2.0)
        self.messagesViewControllerDelegate = self
        
        setupGestures()
    }
    
    @IBAction func pinch(_ sender: Any) {
        print("pinch")
        gameState.currentTexture = "ivy"
        objectToDraw.changeTexture(resource: "ivy", type: "jpeg", textureLoader: textureLoader)
    }
    
    @IBAction func tap(_ sender: Any) {
        print("tap")
        gameState.currentTexture = "fire"
        objectToDraw.changeTexture(resource: "fire", type: "jpeg", textureLoader: textureLoader)
    }
    
    @IBAction func longPress(_ sender: Any) {
        print("long press")
        gameState.currentTexture = "cube"
        objectToDraw.changeTexture(resource: "cube", type: "png", textureLoader: textureLoader)
    }
    
    //MARK: - MetalViewControllerDelegate
    func renderObjects(_ drawable:CAMetalDrawable) {
        
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
            // 3
            let xDelta = Float((lastPanLocation.x - pointInView.x)/self.view.bounds.width) * panSensivity
            let yDelta = Float((lastPanLocation.y - pointInView.y)/self.view.bounds.height) * panSensivity
            // 4
            //objectToDraw.rotationY -= xDelta
            //objectToDraw.rotationX -= yDelta
            lastPanLocation = pointInView
        } else if panGesture.state == UIGestureRecognizerState.began {
            lastPanLocation = panGesture.location(in: self.view)
        }
    }
    
}

