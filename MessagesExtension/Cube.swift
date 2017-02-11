//
//  Cube.swift
//  Wizard_Duels
//
//  Created by Roslyn Patrick-Sunnes on 2/9/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation
import Metal

class Cube: Node {
    var A = Vertex(x: -1.0, y:   1.0, z:   1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0)
    var B = Vertex(x: -1.0, y:  -1.0, z:   1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0)
    var C = Vertex(x:  1.0, y:  -1.0, z:   1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0)
    var D = Vertex(x:  1.0, y:   1.0, z:   1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0)
    
    var Q = Vertex(x: -1.0, y:   1.0, z:  -1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0)
    var R = Vertex(x:  1.0, y:   1.0, z:  -1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0)
    var S = Vertex(x: -1.0, y:  -1.0, z:  -1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0)
    var T = Vertex(x:  1.0, y:  -1.0, z:  -1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0)
    
    var size: Float = 1.0
    
    init(device: MTLDevice){
        
        let verticesArray:Array<Vertex> = [
            A, B, C, A, C, D,   //front
            R, T, S, Q, R, S,   //back
            Q, S, B, Q, B, A,   //left
            D, C, T, D, T, R,   //right
            Q, A, D, Q, D, R,   //top
            B, S, T, B, T, C    //bottom
        ]
        
        super.init(name: "Cube", vertices: verticesArray, device: device)
    }
    
    override func updateWithDelta(delta: CFTimeInterval) {
        
        super.updateWithDelta(delta: delta)
        
        //this rotates the cube
        //let secsPerMove: Float = 6.0
        //rotationY = sinf( Float(time) * 2.0 * Float(M_PI) / secsPerMove)
        //rotationX = sinf( Float(time) * 2.0 * Float(M_PI) / secsPerMove)
        
        //this makes the cube move back and forth on the x axis
        //positionX = sin(Float(delta))
        
        //this makes the cube move back
        positionZ = -1 * Float(delta)
        
        scale = size
    }
    
    func makeIce() {
        A = Vertex(x: -1.0, y:   1.0, z:   1.0, r:  0.4, g:  0.0, b:  1.0, a:  1.0)
        B = Vertex(x: -1.0, y:  -1.0, z:   1.0, r:  0.0, g:  0.4, b:  1.0, a:  1.0)
        C = Vertex(x:  1.0, y:  -1.0, z:   1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0)
        D = Vertex(x:  1.0, y:   1.0, z:   1.0, r:  0.4, g:  0.4, b:  1.0, a:  1.0)
        
        Q = Vertex(x: -1.0, y:   1.0, z:  -1.0, r:  0.4, g:  0.0, b:  1.0, a:  1.0)
        R = Vertex(x:  1.0, y:   1.0, z:  -1.0, r:  0.0, g:  0.4, b:  1.0, a:  1.0)
        S = Vertex(x: -1.0, y:  -1.0, z:  -1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0)
        T = Vertex(x:  1.0, y:  -1.0, z:  -1.0, r:  0.0, g:  0.4, b:  1.0, a:  1.0)
    }
    
    //make the cube double the size
    func makeBig() {
        size = 2.0
    }
    
    //make the cube half the size
    func makeSmall() {
        size = 0.5
    }
    
    //make the cube its original size
    func makeMedium() {
        size = 1.0
    }
}
