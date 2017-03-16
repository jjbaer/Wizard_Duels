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
        objectToDraw = Cube(device: device, commandQ: commandQueue, textureLoader: textureLoader, texture: currentTexture)
        objectToDraw = Cube(device: device, commandQ: commandQueue, textureLoader: textureLoader, texture: currentTexture)
        objectToDraw.addCube(x: -2.0, y: 0, z: 0)
        objectToDraw.addCube(x: -1.0, y: 1.0, z: -2.0)
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
        default:
            objectToDraw.changeTexture(resource: "cube", type: "png", textureLoader: textureLoader)
        }
    }
    
    @IBAction func pinch(_ sender: Any) {
        currentTexture = "ivy"
    }
    
    @IBAction func tap(_ sender: Any) {
        currentTexture = "fire"
    }
    
    @IBAction func longPress(_ sender: Any) {
        currentTexture = "cube"
    }
    
    //MARK: - MetalViewControllerDelegate
    func renderObjects(_ drawable:CAMetalDrawable) {
        
        initializeTexture(texture: currentTexture)
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

