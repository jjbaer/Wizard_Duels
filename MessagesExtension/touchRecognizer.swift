//
//  touchRecognizer.swift
//  Wizard_Duels
//
//  Created by Roslyn Patrick-Sunnes on 2/10/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation

class TouchRecognizer {
    var color = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
    var gesture = "nothing yet"
    
    init() {
        color = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        gesture = "nothing yet"
    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        print(" Handle long press...")
        gesture = "long press"
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print(" Handle tap...")
        gesture = "tap"
    }
    
    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
        print(" Handle rotate...")
        gesture = "rotate"
    }
    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        print(" Handle pinch...")
        gesture = "pinch"
    }
    
    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe down...")
        color = UIColor(red: 0, green: 1, blue: 0, alpha: 1).cgColor
        gesture = "down"
    }
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe up...")
        color = UIColor(red: 0, green: 0, blue: 1, alpha: 1).cgColor
        gesture = "up"
    }
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe right...")
        color = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        gesture = "right"
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        print(" Handle swipe left...")
        color = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        gesture = "left"
    }
    
    func getGesture() -> String? {
        return gesture
    }
    
    func getColor() -> CGColor? {
        return color
    }
    
}
