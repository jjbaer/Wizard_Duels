//
//  Wizard.swift
//  Wizard_Duels
//
//  Created by Roslyn Patrick-Sunnes on 4/26/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation

//This class contains all the vertex data for the opposing wizard in the room
class Wizard {
    
    //Wizard Head
    //Front
    let A = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Back
    let U = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //Wizard Body
    //Front
    let A2 = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B2 = Vertex(x: -1.5, y: -3.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C2 = Vertex(x: 1.5, y: -3.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D2 = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E2 = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F2 = Vertex(x: -1.5, y: -3.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G2 = Vertex(x: -1.5, y: -3.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H2 = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I2 = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J2 = Vertex(x: 1.5, y: -3.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K2 = Vertex(x: 1.5, y: -3.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L2 = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Bot
    let Q2 = Vertex(x: -1.5, y: -3.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R2 = Vertex(x: -1.5, y: -3.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S2 = Vertex(x: 1.5, y: -3.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T2 = Vertex(x: 1.5, y: -3.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    
    //Back
    let U2 = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V2 = Vertex(x: 1.5, y: -3.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W2 = Vertex(x: -1.5, y: -3.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X2 = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //Wizard hat rim
    //Front
    let A3 = Vertex(x: -1.0, y: 2.6, z: -1.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B3 = Vertex(x: -1.0, y: 2.5, z: -1.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C3 = Vertex(x: 1.0, y: 2.5, z: -1.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D3 = Vertex(x: 1.0, y: 2.6, z: -1.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E3 = Vertex(x: -1.0, y: 2.6, z: -3.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F3 = Vertex(x: -1.0, y: 2.5, z: -3.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G3 = Vertex(x: -1.0, y: 2.5, z: -1.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H3 = Vertex(x: -1.0, y: 2.6, z: -1.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I3 = Vertex(x: 1.0, y: 2.6, z: -1.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J3 = Vertex(x: 1.0, y: 2.5, z: -1.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K3 = Vertex(x: 1.0, y: 2.5, z: -3.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L3 = Vertex(x: 1.0, y: 2.6, z: -3.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Top
    let M3 = Vertex(x: -1.0, y: 2.6, z: -3.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N3 = Vertex(x: -1.0, y: 2.6, z: -1.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O3 = Vertex(x: 1.0, y: 2.6, z: -1.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P3 = Vertex(x: 1.0, y: 2.6, z: -3.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    //Bot
    let Q3 = Vertex(x: -1.0, y: 2.5, z: -1.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R3 = Vertex(x: -1.0, y: 2.5, z: -3.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S3 = Vertex(x: 1.0, y: 2.5, z: -3.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T3 = Vertex(x: 1.0, y: 2.5, z: -1.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    
    //Back
    let U3 = Vertex(x: 1.0, y: 2.6, z: -3.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V3 = Vertex(x: 1.0, y: 2.5, z: -3.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W3 = Vertex(x: -1.0, y: 2.5, z: -3.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X3 = Vertex(x: -1.0, y: 2.6, z: -3.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //hat point
    //Front
    let A4 = Vertex(x: 0.0, y: 4.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B4 = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C4 = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D4 = Vertex(x: 0.0, y: 4.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E4 = Vertex(x: 0.0, y: 4.0, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F4 = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G4 = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H4 = Vertex(x: 0.0, y: 4.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I4 = Vertex(x: 0.0, y: 4.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J4 = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K4 = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L4 = Vertex(x: 0.0, y: 4.0, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Back
    let U4 = Vertex(x: 0.0, y: 4.0, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V4 = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W4 = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X4 = Vertex(x: 0.0, y: 4.0, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //Wizard Arms (Right)
    //Front
    let A5 = Vertex(x: 0.5, y: 1.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B5 = Vertex(x: 0.5, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C5 = Vertex(x: 1.5, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D5 = Vertex(x: 1.5, y: 1.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E5 = Vertex(x: 0.5, y: 1.0, z: -2.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F5 = Vertex(x: 0.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G5 = Vertex(x: 0.5, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H5 = Vertex(x: 0.5, y: 1.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I5 = Vertex(x: 1.5, y: 1.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J5 = Vertex(x: 1.5, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K5 = Vertex(x: 1.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L5 = Vertex(x: 1.5, y: 1.0, z: -2.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Top
    let M5 = Vertex(x: 0.5, y: 1.0, z: -2.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N5 = Vertex(x: 0.5, y: 1.0, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O5 = Vertex(x: 1.5, y: 1.0, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P5 = Vertex(x: 1.5, y: 1.0, z: -2.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    //Bot
    let Q5 = Vertex(x: 0.5, y: 0.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R5 = Vertex(x: 0.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S5 = Vertex(x: 1.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T5 = Vertex(x: 1.5, y: 0.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    
    //Back
    let U5 = Vertex(x: 1.5, y: 1.0, z: -2.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V5 = Vertex(x: 1.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W5 = Vertex(x: 0.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X5 = Vertex(x: 0.5, y: 1.0, z: -2.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //right forearm
    //Front
    let A6 = Vertex(x: 1.6, y: 2.2, z: -1.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B6 = Vertex(x: 1.5, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C6 = Vertex(x: 2.0, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D6 = Vertex(x: 1.9, y: 2.2, z: -1.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E6 = Vertex(x: 1.6, y: 2.2, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F6 = Vertex(x: 1.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G6 = Vertex(x: 1.5, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H6 = Vertex(x: 1.6, y: 2.2, z: -1.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I6 = Vertex(x: 1.9, y: 2.2, z: -1.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J6 = Vertex(x: 2.0, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K6 = Vertex(x: 2.0, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L6 = Vertex(x: 1.9, y: 2.2, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Top
    let M6 = Vertex(x: 1.6, y: 2.2, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N6 = Vertex(x: 1.6, y: 2.2, z: -1.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O6 = Vertex(x: 1.9, y: 2.2, z: -1.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P6 = Vertex(x: 1.9, y: 2.2, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    //Bot
    let Q6 = Vertex(x: 1.5, y: 0.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R6 = Vertex(x: 1.5, y: 0.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S6 = Vertex(x: 2.0, y: 0.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T6 = Vertex(x: 2.0, y: 0.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    
    //Back
    let U6 = Vertex(x: 1.9, y: 2.2, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V6 = Vertex(x: 2.0, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W6 = Vertex(x: 1.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X6 = Vertex(x: 1.6, y: 2.2, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //Wizard Arms (Left)
    //Front
    let A7 = Vertex(x: -0.5, y: 1.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B7 = Vertex(x: -0.5, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C7 = Vertex(x: -1.5, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D7 = Vertex(x: -1.5, y: 1.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E7 = Vertex(x: -0.5, y: 1.0, z: -2.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F7 = Vertex(x: -0.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G7 = Vertex(x: -0.5, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H7 = Vertex(x: -0.5, y: 1.0, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I7 = Vertex(x: -1.5, y: 1.0, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J7 = Vertex(x: -1.5, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K7 = Vertex(x: -1.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L7 = Vertex(x: -1.5, y: 1.0, z: -2.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Top
    let M7 = Vertex(x: -0.5, y: 1.0, z: -2.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N7 = Vertex(x: -0.5, y: 1.0, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O7 = Vertex(x: -1.5, y: 1.0, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P7 = Vertex(x: -1.5, y: 1.0, z: -2.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    //Bot
    let Q7 = Vertex(x: -0.5, y: 0.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R7 = Vertex(x: -0.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S7 = Vertex(x: -1.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T7 = Vertex(x: -1.5, y: 0.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    
    //Back
    let U7 = Vertex(x: -1.5, y: 1.0, z: -2.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V7 = Vertex(x: -1.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W7 = Vertex(x: -0.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X7 = Vertex(x: -0.5, y: 1.0, z: -2.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //left forearm
    //Front
    let A8 = Vertex(x: -1.6, y: 2.2, z: -1.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B8 = Vertex(x: -1.5, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C8 = Vertex(x: -2.0, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D8 = Vertex(x: -1.9, y: 2.2, z: -1.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E8 = Vertex(x: -1.6, y: 2.2, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F8 = Vertex(x: -1.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G8 = Vertex(x: -1.5, y: 0.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H8 = Vertex(x: -1.6, y: 2.2, z: -1.5, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I8 = Vertex(x: -1.9, y: 2.2, z: -1.5, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J8 = Vertex(x: -2.0, y: 0.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K8 = Vertex(x: -2.0, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L8 = Vertex(x: -1.9, y: 2.2, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Top
    let M8 = Vertex(x: -1.6, y: 2.2, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N8 = Vertex(x: -1.6, y: 2.2, z: -1.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O8 = Vertex(x: -1.9, y: 2.2, z: -1.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P8 = Vertex(x: -1.9, y: 2.2, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    //Bot
    let Q8 = Vertex(x: -1.5, y: 0.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R8 = Vertex(x: -1.5, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S8 = Vertex(x: -2.0, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T8 = Vertex(x: -2.0, y: 0.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    
    //Back
    let U8 = Vertex(x: -1.9, y: 2.2, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V8 = Vertex(x: -2.0, y: 0.5, z: -2.5, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W8 = Vertex(x: -1.5, y: 0.5, z: -2.5, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X8 = Vertex(x: -1.6, y: 2.2, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)

    func getVertices() -> Array<Vertex> {
        let verticesArray:Array<Vertex> = [
            //right arm
            A5,B5,C5 ,A5,C5,D5,   //Front
            E5,F5,G5 ,E5,G5,H5,   //Left
            I5,J5,K5 ,I5,K5,L5,   //Right
            M5,N5,O5 ,M5,O5,P5,   //Top
            Q5,R5,S5 ,Q5,S5,T5,   //Bot
            U5,V5,W5 ,U5,W5,X5,    //Back
            //right fore arm
            A6,B6,C6 ,A6,C6,D6,   //Front
            E6,F6,G6 ,E6,G6,H6,   //Left
            I6,J6,K6 ,I6,K6,L6,   //Right
            M6,N6,O6 ,M6,O6,P6,   //Top
            Q6,R6,S6 ,Q6,S6,T6,   //Bot
            U6,V6,W6 ,U6,W6,X6,    //Back
            //left arm
            A7,B7,C7 ,A7,C7,D7,   //Front
            E7,F7,G7 ,E7,G7,H7,   //Left
            I7,J7,K7 ,I7,K7,L7,   //Right
            M7,N7,O7 ,M7,O7,P7,   //Top
            Q7,R7,S7 ,Q7,S7,T7,   //Bot
            U7,V7,W7 ,U7,W7,X7,    //Back
            //left fore arm
            A8,B8,C8 ,A8,C8,D8,   //Front
            E8,F8,G8 ,E8,G8,H8,   //Left
            I8,J8,K8 ,I8,K8,L8,   //Right
            M8,N8,O8 ,M8,O8,P8,   //Top
            Q8,R8,S8 ,Q8,S8,T8,   //Bot
            U8,V8,W8 ,U8,W8,X8,    //Back
            //body
            A2,B2,C2 ,A2,C2,D2,   //Front
            E2,F2,G2 ,E2,G2,H2,   //Left
            I2,J2,K2 ,I2,K2,L2,   //Right
            Q2,R2,S2 ,Q2,S2,T2,   //Bot
            U2,V2,W2 ,U2,W2,X2,    //Back
            //hat point
            A4,B4,C4 ,A4,C4,D4,   //Front
            E4,F4,G4 ,E4,G4,H4,   //Left
            I4,J4,K4 ,I4,K4,L4,   //Right
            U4,V4,W4 ,U4,W4,X4,    //Back
            //hat rim
            A3,B3,C3 ,A3,C3,D3,   //Front
            E3,F3,G3 ,E3,G3,H3,   //Left
            I3,J3,K3 ,I3,K3,L3,   //Right
            M3,N3,O3 ,M3,O3,P3,   //Top
            Q3,R3,S3 ,Q3,S3,T3,   //Bot
            U3,V3,W3 ,U3,W3,X3,    //Back
            //head
            A,B,C ,A,C,D,   //Front
            E,F,G ,E,G,H,   //Left
            I,J,K ,I,K,L,   //Right
            U,V,W ,U,W,X,    //Back
            
        ]
        return verticesArray
    }
}
