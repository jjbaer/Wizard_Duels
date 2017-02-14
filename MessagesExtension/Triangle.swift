//
//  Triangle.swift
//  Wizard_Duels
//
//  Created by Roslyn Patrick-Sunnes on 2/9/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation
import Metal

class Triangle: Node {
    
    init(device: MTLDevice) {
        
        let V0 = Vertex(x:  0.0, y:   0.0, z:   -1.0, r:  0.0, g:  0.0, b:  0.0, a:  1.0)
        let V1 = Vertex(x: -1.0, y:  -1.0, z:   0.0, r:  0.0, g:  0.0, b:  0.0, a:  1.0)
        let V2 = Vertex(x:  1.0, y:  -1.0, z:   0.0, r:  0.0, g:  0.0, b:  0.0, a:  1.0)
        
        let verticesArray = [V0, V1, V2]
        super.init(name: "Triangle", vertices: verticesArray, device: device)
        
        positionY = -5.0
        scale = 10.0
    }
    
}
