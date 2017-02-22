//
//  MySceneViewController.swift
//  Wizard_Duels
//
//  Created by Jenna on 2/16/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation
import UIKit

class MySceneViewController: MessagesViewController,MessagesViewControllerDelegate {
    
    var worldModelMatrix:Matrix4!
    var objectToDraw: Cube!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        worldModelMatrix = Matrix4()
        worldModelMatrix.translate(0.0, y: 0.0, z: -4)
        worldModelMatrix.rotateAroundX(Matrix4.degrees(toRad: 25), y: 0.0, z: 0.0)
        
        objectToDraw = Cube(device: device, commandQ:commandQueue)
        self.messagesViewControllerDelegate = self
    }
    
  /*  @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        print(" Handle long press...")
        gesture = "long press"
        objectToDraw.makeMedium()
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print(" Handle tap...")
        gesture = "tap"
        objectToDraw.makeBig()
    }
    
    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
        print(" Handle rotate...")
        gesture = "rotate"
        objectToDraw.makeSmall()
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        print(" Handle pinch...")
        gesture = "pinch"
        objectToDraw.makeSmall()
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe down...")
        canvas.setColor(newColor: UIColor(red: 0, green: 1, blue: 0, alpha: 1))
        gesture = "down"
//        objectToDraw.makeEarth()
    }
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe up...")
        canvas.setColor(newColor: UIColor(red: 0, green: 0, blue: 1, alpha: 1))
        gesture = "up"
//        objectToDraw.makeIce()
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe right...")
        canvas.setColor(newColor: UIColor(red: 0, green: 0, blue: 0, alpha: 1))
        gesture = "right"
//        objectToDraw.makeLightening()
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe left...")
        canvas.setColor(newColor: UIColor(red: 1, green: 0, blue: 0, alpha: 1))
        gesture = "left"
//        objectToDraw.makeFire()
    }
    */
    //MARK: - MessagesViewControllerDelegate
    func renderObjects(_ drawable:CAMetalDrawable) {
        
        objectToDraw.render(commandQueue: commandQueue, pipelineState: pipelineState, drawable: drawable, parentModelViewMatrix: worldModelMatrix, projectionMatrix: projectionMatrix, clearColor: nil)
    }
    
    func updateLogic(_ timeSinceLastUpdate: CFTimeInterval) {
        objectToDraw.updateWithDelta(delta: timeSinceLastUpdate)
    }
    
    
}
