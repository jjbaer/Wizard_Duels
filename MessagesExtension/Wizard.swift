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
    
    //Top
   /* let M = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)*/
    
    //Bot
  /*  let Q = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)*/
    
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
    
    //Top
   /* let M2 = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N2 = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O2 = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P2 = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)*/
    
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
    
    //Top
    /* let M = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
     let N = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
     let O = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
     let P = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)*/
    
    //Bot
    /*  let Q = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
     let R = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
     let S = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
     let T = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)*/
    
    //Back
    let U4 = Vertex(x: 0.0, y: 4.0, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V4 = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W4 = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X4 = Vertex(x: 0.0, y: 4.0, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    
    //Wizard Arms (Right)
    //Front
    let A5 = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    let B5 = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let C5 = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
    let D5 = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
    
    //Left
    let E5 = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    let F5 = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let G5 = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
    let H5 = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
    
    //Right
    let I5 = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    let J5 = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let K5 = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
    let L5 = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
    
    //Top
    let M5 = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    let N5 = Vertex(x: -0.5, y: 2.5, z: -2.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let O5 = Vertex(x: 0.5, y: 2.5, z: -2.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
    let P5 = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
    
    //Bot
    let Q5 = Vertex(x: -0.5, y: 1.5, z: -2.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    let R5 = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let S5 = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
    let T5 = Vertex(x: 0.5, y: 1.5, z: -2.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
    
    //Back
    let U5 = Vertex(x: 0.5, y: 2.5, z: -3.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
    let V5 = Vertex(x: 0.5, y: 1.5, z: -3.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let W5 = Vertex(x: -0.5, y: 1.5, z: -3.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
    let X5 = Vertex(x: -0.5, y: 2.5, z: -3.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)

    func getVertices() -> Array<Vertex> {
        let verticesArray:Array<Vertex> = [
            //body
            A2,B2,C2 ,A2,C2,D2,   //Front
            E2,F2,G2 ,E2,G2,H2,   //Left
            I2,J2,K2 ,I2,K2,L2,   //Right
            //M,N,O ,M,O,P,   //Top
            Q2,R2,S2 ,Q2,S2,T2,   //Bot
            U2,V2,W2 ,U2,W2,X2,    //Back
            //hat point
            A4,B4,C4 ,A4,C4,D4,   //Front
            E4,F4,G4 ,E4,G4,H4,   //Left
            I4,J4,K4 ,I4,K4,L4,   //Right
            //M,N,O ,M,O,P,   //Top
            //Q,R,S ,Q,S,T,   //Bot
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
            //M,N,O ,M,O,P,   //Top
            //Q,R,S ,Q,S,T,   //Bot
            U,V,W ,U,W,X,    //Back
            //right arm
            //left arm
            
        ]
        return verticesArray
    }
}
