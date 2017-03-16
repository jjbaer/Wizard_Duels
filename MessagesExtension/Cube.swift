//
//  Cube.swift
//  Duel
//
//  Created by Jenna on 2/23/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import UIKit
import MetalKit

class Cube: Node {
    var verticesArray:Array<Vertex>
    let building:Building
    
    init(device: MTLDevice, commandQ: MTLCommandQueue, textureLoader :MTKTextureLoader, texture: String) {
        //Front
        let A = Vertex(x: 1.0, y: 1.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        let B = Vertex(x: 1.0, y: 0.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let C = Vertex(x: 2.0, y: 0.0, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let D = Vertex(x: 2.0, y: 1.0, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        
        //Left
        let E = Vertex(x: 1.0, y:   1.0, z:  0.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        let F = Vertex(x: 1.0, y:  0.0, z:  0.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let G = Vertex(x: 1.0, y:  0.0, z:   1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let H = Vertex(x: 1.0, y:   1.0, z:   1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        
        //Right
        let I = Vertex(x: 2.0, y: 1.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        let J = Vertex(x: 2.0, y: 0.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let K = Vertex(x: 2.0, y: 0.0, z: 0.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let L = Vertex(x: 2.0, y: 1.0, z: 0.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        
        //Top
        let M = Vertex(x: 1.0, y: 1.0, z: 0.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        let N = Vertex(x: 1.0, y: 1.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let O = Vertex(x: 2.0, y: 1.0, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let P = Vertex(x: 2.0, y: 1.0, z: 0.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        
        //Bot
        let Q = Vertex(x: 1.0, y: 0.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        let R = Vertex(x: 1.0, y: 0.0, z: 0.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let S = Vertex(x: 2.0, y: 0.0, z: 0.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let T = Vertex(x: 2.0, y: 0.0, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        
        //Back
        let U = Vertex(x: 2.0, y: 1.0, z: 0.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        let V = Vertex(x: 2.0, y: 0.0, z: 0.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let W = Vertex(x: 1.0, y: 0.0, z: 0.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let X = Vertex(x: 1.0, y: 1.0, z: 0.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        
        self.building = Building()
        
        verticesArray = [
            A,B,C ,A,C,D,   //Front
            E,F,G ,E,G,H,   //Left
            I,J,K ,I,K,L,   //Right
            M,N,O ,M,O,P,   //Top
            Q,R,S ,Q,S,T,   //Bot
            U,V,W ,U,W,X    //Back
        ]
        
        verticesArray = building.getVertices() + verticesArray
        var path: String
        
        if (texture == "cube") {
            path = Bundle.main.path(forResource: "cube", ofType: "png")!
        }
        else if (texture == "fire") {
            path = Bundle.main.path(forResource: "fire", ofType: "jpeg")!
        }
        else {
            path = Bundle.main.path(forResource: "ivy", ofType: "jpeg")!
        }
        
        let data = NSData(contentsOfFile: path) as! Data
        let texture = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        //setting texture for floor
        let path2 = Bundle.main.path(forResource: "wood", ofType: "jpeg")!
        let data2 = NSData(contentsOfFile: path2) as! Data
        let texture2 = try! textureLoader.newTexture(with: data2, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        // setting texture for walls
        let path3 = Bundle.main.path(forResource: "stone", ofType: "jpeg")!
        let data3 = NSData(contentsOfFile: path3) as! Data
        let texture3 = try! textureLoader.newTexture(with: data3, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        // fix later, this should be sky
        let path4 = Bundle.main.path(forResource: "storm", ofType: "jpeg")!
        let data4 = NSData(contentsOfFile: path4) as! Data
        let texture4 = try! textureLoader.newTexture(with: data4, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        super.init(name: "Cube", vertices: verticesArray, device: device, texture: texture, texture2: texture2, texture3: texture3, texture4: texture4)
        
    }
    
    func addCube(x: Float, y: Float, z: Float) {
        //Front
        let A = Vertex(x: 1.0 + x, y: 1.0 + y, z: 1.0 + z, r: 1.0, g: 0.0, b: 0.0, a: 1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        let B = Vertex(x: 1.0 + x, y: y, z: 1.0 + z, r: 0.0, g: 1.0, b: 0.0, a: 1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let C = Vertex(x: 2.0 + x, y: y, z: 1.0 + z, r: 0.0, g: 0.0, b: 1.0, a: 1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let D = Vertex(x: 2.0 + x, y: 1.0 + y, z: 1.0 + z, r: 0.1, g: 0.6, b: 0.4, a: 1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        
        //Left
        let E = Vertex(x: 1.0 + x, y: 1.0 + y, z:  z, r: 1.0, g: 0.0, b: 0.0, a: 1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        let F = Vertex(x: 1.0 + x, y: y, z: z, r: 0.0, g: 1.0, b: 0.0, a: 1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let G = Vertex(x: 1.0 + x, y: y, z: 1.0 + z, r: 0.0, g: 0.0, b: 1.0, a: 1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let H = Vertex(x: 1.0 + x, y: 1.0 + y, z: 1.0 + z, r: 0.1, g: 0.6, b: 0.4, a: 1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        
        //Right
        let I = Vertex(x: 2.0 + x, y: 1.0 + y, z: 1.0 + z, r: 1.0, g: 0.0, b: 0.0, a: 1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        let J = Vertex(x: 2.0 + x, y: y, z: 1.0 + z, r: 0.0, g: 1.0, b: 0.0, a: 1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let K = Vertex(x: 2.0 + x, y: y, z: z, r: 0.0, g: 0.0, b: 1.0, a: 1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let L = Vertex(x: 2.0 + x, y: 1.0 + y, z: z, r: 0.1, g: 0.6, b: 0.4, a: 1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        
        //Top
        let M = Vertex(x: 1.0 + x, y: 1.0 + y, z: z, r: 1.0, g: 0.0, b: 0.0, a: 1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        let N = Vertex(x: 1.0 + x, y: 1.0 + y, z: 1.0 + z, r: 0.0, g: 1.0, b: 0.0, a: 1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let O = Vertex(x: 2.0 + x, y: 1.0 + y, z: 1.0 + z, r: 0.0, g: 0.0, b: 1.0, a: 1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let P = Vertex(x: 2.0 + x, y: 1.0 + y, z: z, r: 0.1, g: 0.6, b: 0.4, a: 1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        
        //Bot
        let Q = Vertex(x: 1.0 + x, y: y, z: 1.0 + z, r: 1.0, g: 0.0, b: 0.0, a: 1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        let R = Vertex(x: 1.0 + x, y: y, z: z, r: 0.0, g: 1.0, b: 0.0, a: 1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let S = Vertex(x: 2.0 + x, y: y, z: z, r: 0.0, g: 0.0, b: 1.0, a: 1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let T = Vertex(x: 2.0 + x, y: y, z: 1.0 + z, r: 0.1, g: 0.6, b: 0.4, a: 1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        
        //Back
        let U = Vertex(x: 2.0 + x, y: 1.0 + y, z: z, r: 1.0, g: 0.0, b: 0.0, a: 1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        let V = Vertex(x: 2.0 + x, y: y, z: z, r: 0.0, g: 1.0, b: 0.0, a: 1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let W = Vertex(x: 1.0 + x, y: y, z: z, r: 0.0, g: 0.0, b: 1.0, a: 1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let X = Vertex(x: 1.0 + x, y: 1.0 + y, z: z, r: 0.1, g: 0.6, b: 0.4, a: 1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        
        let newCube:Array<Vertex> = [
            A,B,C ,A,C,D,   //Front
            E,F,G ,E,G,H,   //Left
            I,J,K ,I,K,L,   //Right
            M,N,O ,M,O,P,   //Top
            Q,R,S ,Q,S,T,   //Bot
            U,V,W ,U,W,X,    //Back
        ]
        
        verticesArray += newCube
        update(vertices: verticesArray)
    }
    
    func changeTexture(resource: String, type: String, textureLoader :MTKTextureLoader) {
        let path = Bundle.main.path(forResource: resource, ofType: type)!
        let data = NSData(contentsOfFile: path) as! Data
        let newTexture = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        updateTexture(texture: newTexture)
    }
}
