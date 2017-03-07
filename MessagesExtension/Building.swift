//
//  Building.swift
//  Wizard_Duels
//
//  Created by Roslyn Patrick-Sunnes on 3/6/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation

//This class just holds all the vertex data for the walls and floor
class Building {
    
    //floor
    let f1 = Vertex(x: 0.0, y: -3.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f2 = Vertex(x: 0.0, y: -3.0, z: 2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f3 = Vertex(x: 4.0, y: -3.0, z: 2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f4 = Vertex(x: 4.0, y: -3.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    let f5 = Vertex(x: -4.0, y: -3.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f6 = Vertex(x: -4.0, y: -3.0, z: 2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f7 = Vertex(x: 0.0, y: -3.0, z: 2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f8 = Vertex(x: 0.0, y: -3.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    let f9 = Vertex(x: 0.0, y: -3.0, z: -5.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f10 = Vertex(x: 0.0, y: -3.0, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f11 = Vertex(x: 4.0, y: -3.0, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f12 = Vertex(x: -4.0, y: -3.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    let f13 = Vertex(x: 4.0, y: -3.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f14 = Vertex(x: 4.0, y: -3.0, z: 2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f15 = Vertex(x: 8.0, y: -3.0, z: 2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    let f16 = Vertex(x: -4.0, y: -3.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f17 = Vertex(x: -4.0, y: -3.0, z: 2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let f18 = Vertex(x: -8.0, y: -3.0, z: 2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    //wall1
    let w1 = Vertex(x: -4.0, y: 1.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w2 = Vertex(x: -4.0, y: -3.0, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w3 = Vertex(x: 0.0, y: -3.0, z: -5.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w4 = Vertex(x: 0.0, y: 1.0, z: -5.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    let w5 = Vertex(x: -4.0, y: 5.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w6 = Vertex(x: -4.0, y: 1.0, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w7 = Vertex(x: 0.0, y: 1.0, z: -5.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w8 = Vertex(x: 0.0, y: 5.0, z: -5.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    let w9 = Vertex(x: -8.0, y: 5.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w10 = Vertex(x: -8.0, y: 1.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w11 = Vertex(x: -4.0, y: 1.0, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w12 = Vertex(x: -4.0, y: 5.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    let w13 = Vertex(x: -8.0, y: 1.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w14 = Vertex(x: -8.0, y: -3.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w15 = Vertex(x: -4.0, y: -3.0, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let w16 = Vertex(x: -4.0, y: 1.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //wall2
    let y1 = Vertex(x: 0.0, y: 1.0, z: -5.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y2 = Vertex(x: 0.0, y: -3.0, z: -5.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y3 = Vertex(x: 4.0, y: -3.0, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y4 = Vertex(x: 4.0, y: 1.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    let y5 = Vertex(x: 0.0, y: 5.0, z: -5.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y6 = Vertex(x: 0.0, y: 1.0, z: -5.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y7 = Vertex(x: 4.0, y: 1.0, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y8 = Vertex(x: 4.0, y: 5.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    let y9 = Vertex(x: 4.0, y: 5.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y10 = Vertex(x: 4.0, y: 1.0, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y11 = Vertex(x: 8.0, y: 1.0, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y12 = Vertex(x: 8.0, y: 5.0, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    let y13 = Vertex(x: 4.0, y: 1.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y14 = Vertex(x: 4.0, y: -3.0, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y15 = Vertex(x: 8.0, y: -3.0, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let y16 = Vertex(x: 8.0, y: 1.0, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    func getVertices() -> Array<Vertex> {
        let verticesArray:Array<Vertex> = [
            f1, f2, f3, f1, f3, f4,     //floor
            f5, f6, f7, f5, f7, f8,
            f9, f10, f11, f12, f10, f9,
            f13, f14, f15, f18, f17, f16,
            w1, w2, w3, w1, w3, w4,     //wall1
            w5, w6, w7, w5, w7, w8,
            w9, w10, w11, w9, w11, w12,
            w13, w14, w15, w13, w15, w16,
            y1, y2, y3, y1, y3, y4,     //wall2
            y5, y6, y7, y5, y7, y8,
            y9, y10, y11, y9, y11, y12,
            y13, y14, y15, y13, y15, y16,
        ]
        return verticesArray
    }
}