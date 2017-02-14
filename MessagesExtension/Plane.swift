//
//  Plane.swift
//  Wizard_Duels
//
//  Created by Roslyn Patrick-Sunnes on 2/13/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation
import Metal

class Plane: Node {
    
    init(device: MTLDevice) {
        
        let V0 = Vertex(x:  -1.0, y:   1.0, z:   -1.0, r:  0.0, g:  0.0, b:  0.0, a:  1.0)
        let V1 = Vertex(x: -1.0, y:  -1.0, z:   0.0, r:  0.0, g:  0.0, b:  0.0, a:  1.0)
        let V2 = Vertex(x:  1.0, y:  -1.0, z:   0.0, r:  0.0, g:  0.0, b:  0.0, a:  1.0)
        let V3 = Vertex(x: 1.0, y:  1.0, z:   -1.0, r:  0.0, g:  0.0, b:  0.0, a:  1.0)

        let verticesArray = [V0, V1, V2, V0, V2, V3]
        super.init(name: "Plane", vertices: verticesArray, device: device)
        
        positionY = -10.0
        scale = 8.0
    }
    
}
