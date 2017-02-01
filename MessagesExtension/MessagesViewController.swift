//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Jenna and Roslyn on 1/12/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    @IBOutlet weak var canvas: UIImageView!
    var lastPoint = CGPoint.zero
    var swiped = false
    var color = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor

    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        print(" Handle long press...")
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print(" Handle tap...")
    }
    
    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
        print(" Handle rotate...")
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        print(" Handle pinch...")
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe down...")
        color = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor
    }
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe up...")
        color = UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe right...")
        color = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe left...")
        color = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func drawLines(fromPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(canvas.frame.size)
        canvas.image?.draw(in: CGRect(x: 0.0, y: 0.0, width: canvas.frame.width, height: canvas.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(color)
        context?.strokePath()
        canvas.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: canvas)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        if let touch = touches.first {
            let currentPoint = touch.location(in: canvas)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLines(fromPoint: lastPoint, toPoint: lastPoint)
        }
    }
    
    func createImageForMessage() -> UIImage? {
        let background = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        background.backgroundColor = UIColor.white
        
        let label = UILabel(frame: CGRect(x: 75, y: 75, width: 150, height: 150))
        label.font = UIFont.systemFont(ofSize: 56.0)
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.white
        label.text = "Yo"
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
   
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
    
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
    
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
    
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }

}
