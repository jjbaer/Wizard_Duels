//
//  Cube.swift
//  Duel
//
//  Created by Jenna on 2/23/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import UIKit
import MetalKit
import Foundation

class Cube: Node {
    var verticesArray:Array<Vertex>
    let building:Building
    let wizard:Wizard
    var motion:String
    
    init(device: MTLDevice, commandQ: MTLCommandQueue, textureLoader :MTKTextureLoader, texture: String) {
        
        motion = ""
        
        //Front
        let A = Vertex(x: -0.5, y: 1.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        let B = Vertex(x: -0.5, y: 0.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let C = Vertex(x: 0.5, y: 0.0, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let D = Vertex(x: 0.5, y: 1.0, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        
        //Left
        let E = Vertex(x: -0.5, y:   1.0, z:  0.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        let F = Vertex(x: -0.5, y:  0.0, z:  0.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let G = Vertex(x: -0.5, y:  0.0, z:   1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let H = Vertex(x: -0.5, y:   1.0, z:   1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        
        //Right
        let I = Vertex(x: 0.5, y: 1.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        let J = Vertex(x: 0.5, y: 0.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let K = Vertex(x: 0.5, y: 0.0, z: 0.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let L = Vertex(x: 0.5, y: 1.0, z: 0.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        
        //Top
        let M = Vertex(x: -0.5, y: 1.0, z: 0.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        let N = Vertex(x: -0.5, y: 1.0, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let O = Vertex(x: 0.5, y: 1.0, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let P = Vertex(x: 0.5, y: 1.0, z: 0.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        
        //Bot
        let Q = Vertex(x: -0.5, y: 0.0, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        let R = Vertex(x: -0.5, y: 0.0, z: 0.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let S = Vertex(x: 0.5, y: 0.0, z: 0.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let T = Vertex(x: 0.5, y: 0.0, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        
        //Back
        let U = Vertex(x: 0.5, y: 1.0, z: 0.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        let V = Vertex(x: 0.5, y: 0.0, z: 0.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let W = Vertex(x: -0.5, y: 0.0, z: 0.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let X = Vertex(x: -0.5, y: 1.0, z: 0.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        
        self.building = Building()
        self.wizard = Wizard()
        
        verticesArray = [
            A,B,C ,A,C,D,   //Front
            E,F,G ,E,G,H,   //Left
            I,J,K ,I,K,L,   //Right
            M,N,O ,M,O,P,   //Top
            Q,R,S ,Q,S,T,   //Bot
            U,V,W ,U,W,X    //Back
        ]
        
        verticesArray = building.getVertices() + wizard.getVertices() + verticesArray
        
        //setting texture for the cube
        var path = Bundle.main.path(forResource: "questions", ofType: "png")!
        var data = NSData(contentsOfFile: path)! as Data
        let texture = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        //setting texture for floor
        path = Bundle.main.path(forResource: "wood", ofType: "jpeg")!
        data = NSData(contentsOfFile: path)! as Data
        let texture2 = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        // setting texture for walls
        path = Bundle.main.path(forResource: "stone", ofType: "jpeg")!
        data = NSData(contentsOfFile: path)! as Data
        let texture3 = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        // setting texture for sky
        path = Bundle.main.path(forResource: "storm", ofType: "jpeg")!
        data = NSData(contentsOfFile: path)! as Data
        let texture4 = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        //setting texture of wizard
        path = Bundle.main.path(forResource: "witchFace", ofType: "png")!
        data = NSData(contentsOfFile: path)! as Data
        let texture5 = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        //setting texture of wizard
        path = Bundle.main.path(forResource: "blackFabric", ofType: "jpeg")!
        data = NSData(contentsOfFile: path)! as Data
        let texture6 = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        
        
        super.init(name: "Cube", vertices: verticesArray, device: device, texture: texture, texture2: texture2, texture3: texture3, texture4: texture4, texture5: texture5, texture6: texture6)
        
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
        
        //Bottom
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
    
    //this is the texture of the main cube
    func changeTexture(resource: String, type: String, textureLoader :MTKTextureLoader) {
        let path = Bundle.main.path(forResource: resource, ofType: type)!
        let data = NSData(contentsOfFile: path)! as Data
        let newTexture = try! textureLoader.newTexture(with: data, options: [MTKTextureLoaderOptionSRGB : (false as NSNumber)])
        updateTexture(texture: newTexture)
    }
    
    func updateMotion(newMotion: String) {
        motion = newMotion
    }
    
    override func updateMovement() { 
        super.updateMovement()
        if (motion == "spin") {
            //spin cube in a wiggly crazy fiery fashion
            spinCube(x: 0.5*cos(time), y: 0.5*sin(time), z: 0.5*sin(time) + time*2.0)
        }
        else if (motion == "grow") {
            growCube(x: time, y: time, z: time)
        }
        else if (motion == "sinWave") {
            //move cube in a wiggly wave
            moveCube(x: sin(time), y: sin(time), z: 2.0*time)
        }
        else {
            //move cube straight back
            moveCube(x: 0.0, y: 0.0, z: 2.0*time)
        }
    }
    
    //method to spin the cube when a spell is cast
    func spinCube(x: Float, y: Float, z: Float) {
        let range:Range = 408..<444 //36 vertices for the cube, it is the last 36 vertices in the array
        //Front
        let A = Vertex(x: -0.5 + x, y: 1.0 - y, z: 1.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        let B = Vertex(x: -0.5  + x, y: 0.0 + y, z: 1.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let C = Vertex(x: 0.5 - x, y: 0.0 - y, z: 1.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let D = Vertex(x: 0.5 - x, y: 1.0 + y, z: 1.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        
        //Left
        let E = Vertex(x: -0.5 - x, y: 1.0 - y, z: 0.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        let F = Vertex(x: -0.5 - x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let G = Vertex(x: -0.5 + x, y: 0.0 - y, z: 1.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let H = Vertex(x: -0.5 + x, y: 1.0 + y, z: 1.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        
        //Right
        let I = Vertex(x: 0.5 - x, y: 1.0 - y, z: 1.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        let J = Vertex(x: 0.5 - x, y: 0.0 + y, z: 1.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let K = Vertex(x: 0.5 + x, y: 0.0 - y, z: 0.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let L = Vertex(x: 0.5 + x, y: 1.0 + y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        
        //Top
        let M = Vertex(x: -0.5 - x, y: 1.0 + y, z: 0.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        let N = Vertex(x: -0.5 + x, y: 1.0 - y, z: 1.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let O = Vertex(x: 0.5 - x, y: 1.0 + y, z: 1.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let P = Vertex(x: 0.5 + x, y: 1.0 + y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        
        //Bot
        let Q = Vertex(x: -0.5 + x, y: 0.0 + y, z: 1.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        let R = Vertex(x: -0.5 - x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let S = Vertex(x: 0.5 + x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let T = Vertex(x: 0.5 - x, y: 0.0 - y, z: 1.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        
        //Back
        let U = Vertex(x: 0.5 + x, y: 1.0 - y, z: 0.0 + z, r: 1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        let V = Vertex(x: 0.5 + x, y: 0.0 + y, z: 0.0 + z, r: 0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let W = Vertex(x: -0.5 - x, y: 0.0 - y, z: 0.0 + z, r: 0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let X = Vertex(x: -0.5 - x, y: 1.0 + y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        
        let newVertices:Array<Vertex> = [
            A,B,C ,A,C,D,   //Front
            E,F,G ,E,G,H,   //Left
            I,J,K ,I,K,L,   //Right
            M,N,O ,M,O,P,   //Top
            Q,R,S ,Q,S,T,   //Bot
            U,V,W ,U,W,X,    //Back
        ]
        
        verticesArray.replaceSubrange(range, with: newVertices)
        update(vertices: verticesArray)
    }
    
    //method to make the cube grow when a spell is cast
    func growCube(x: Float, y: Float, z: Float) {
        let range:Range = 408..<444 //36 vertices for the cube, it is the last 36 vertices in the array
        //Front
        let A = Vertex(x: -0.5 + x, y: 1.0 - y, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        let B = Vertex(x: -0.5 + x, y: 0.0 + y, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let C = Vertex(x: 0.5 - x, y: 0.0 + y, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let D = Vertex(x: 0.5 - x, y: 1.0 - y, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        
        //Left
        let E = Vertex(x: -0.5 + x, y: 1.0 - y, z: 0.0 - z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        let F = Vertex(x: -0.5 + x, y: 0.0 + y, z: 0.0 - z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let G = Vertex(x: -0.5 + x, y: 0.0 + y, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let H = Vertex(x: -0.5 + x, y: 1.0 - y, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        
        //Right
        let I = Vertex(x: 0.5 - x, y: 1.0 - y, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        let J = Vertex(x: 0.5 - x, y: 0.0 + y, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let K = Vertex(x: 0.5 - x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let L = Vertex(x: 0.5 - x, y: 1.0 - y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        
        //Top
        let M = Vertex(x: -0.5 + x, y: 1.0 - y, z: 0.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        let N = Vertex(x: -0.5 + x, y: 1.0 - y, z: 1.0, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let O = Vertex(x: 0.5 - x, y: 1.0 - y, z: 1.0, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let P = Vertex(x: 0.5 - x, y: 1.0 - y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        
        //Bot
        let Q = Vertex(x: -0.5 + x, y: 0.0 + y, z: 1.0, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        let R = Vertex(x: -0.5 + x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let S = Vertex(x: 0.5 - x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let T = Vertex(x: 0.5 - x, y: 0.0 + y, z: 1.0, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        
        //Back
        let U = Vertex(x: 0.5 - x, y: 1.0 - y, z: 0.0 + z, r: 1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        let V = Vertex(x: 0.5 - x, y: 0.0 + y, z: 0.0 + z, r: 0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let W = Vertex(x: -0.5 + x, y: 0.0 + y, z: 0.0 + z, r: 0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let X = Vertex(x: -0.5 + x, y: 1.0 - y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        
        let newVertices:Array<Vertex> = [
            A,B,C ,A,C,D,   //Front
            E,F,G ,E,G,H,   //Left
            I,J,K ,I,K,L,   //Right
            M,N,O ,M,O,P,   //Top
            Q,R,S ,Q,S,T,   //Bot
            U,V,W ,U,W,X,    //Back
        ]
        
        verticesArray.replaceSubrange(range, with: newVertices)
        update(vertices: verticesArray)
    }
    
    //method to move the cube when a spell is cast
    func moveCube(x: Float, y: Float, z: Float) {
        let range:Range = 408..<444 //36 vertices for the cube, it is the last 36 vertices in the array
        //Front
        let A = Vertex(x: -0.5 + x, y: 1.0 + y, z: 1.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        let B = Vertex(x: -0.5  + x, y: 0.0 + y, z: 1.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let C = Vertex(x: 0.5  + x, y: 0.0 + y, z: 1.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: 0.0, nZ: 1.0)
        let D = Vertex(x: 0.5  + x, y: 1.0 + y, z: 1.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 0.0, nZ: 1.0)
        
        //Left
        let E = Vertex(x: -0.5 + x, y: 1.0 + y, z: 0.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.00, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        let F = Vertex(x: -0.5 + x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.00, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let G = Vertex(x: -0.5 + x, y: 0.0 + y, z: 1.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.25, t: 0.50, nX: -1.0, nY: 0.0, nZ: 0.0)
        let H = Vertex(x: -0.5 + x, y: 1.0 + y, z: 1.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.25, t: 0.25, nX: -1.0, nY: 0.0, nZ: 0.0)
        
        //Right
        let I = Vertex(x: 0.5 + x, y: 1.0 + y, z: 1.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.50, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        let J = Vertex(x: 0.5 + x, y: 0.0 + y, z: 1.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.50, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let K = Vertex(x: 0.5 + x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.75, t: 0.50, nX: 1.0, nY: 0.0, nZ: 0.0)
        let L = Vertex(x: 0.5 + x, y: 1.0 + y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.75, t: 0.25, nX: 1.0, nY: 0.0, nZ: 0.0)
        
        //Top
        let M = Vertex(x: -0.5 + x, y: 1.0 + y, z: 0.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        let N = Vertex(x: -0.5 + x, y: 1.0 + y, z: 1.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let O = Vertex(x: 0.5 + x, y: 1.0 + y, z: 1.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.25, nX: 0.0, nY: 1.0, nZ: 0.0)
        let P = Vertex(x: 0.5 + x, y: 1.0 + y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.00, nX: 0.0, nY: 1.0, nZ: 0.0)
        
        //Bot
        let Q = Vertex(x: -0.5 + x, y: 0.0 + y, z: 1.0 + z, r:  1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.25, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        let R = Vertex(x: -0.5 + x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.25, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let S = Vertex(x: 0.5 + x, y: 0.0 + y, z: 0.0 + z, r:  0.0, g:  0.0, b:  1.0, a:  1.0, s: 0.50, t: 0.75, nX: 0.0, nY: -1.0, nZ: 0.0)
        let T = Vertex(x: 0.5 + x, y: 0.0 + y, z: 1.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 0.50, t: 0.50, nX: 0.0, nY: -1.0, nZ: 0.0)
        
        //Back
        let U = Vertex(x: 0.5 + x, y: 1.0 + y, z: 0.0 + z, r: 1.0, g:  0.0, b:  0.0, a:  1.0, s: 0.75, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        let V = Vertex(x: 0.5 + x, y: 0.0 + y, z: 0.0 + z, r: 0.0, g:  1.0, b:  0.0, a:  1.0, s: 0.75, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let W = Vertex(x: -0.5 + x, y: 0.0 + y, z: 0.0 + z, r: 0.0, g:  0.0, b:  1.0, a:  1.0, s: 1.00, t: 0.50, nX: 0.0, nY: 0.0, nZ: -1.0)
        let X = Vertex(x: -0.5 + x, y: 1.0 + y, z: 0.0 + z, r:  0.1, g:  0.6, b:  0.4, a:  1.0, s: 1.00, t: 0.25, nX: 0.0, nY: 0.0, nZ: -1.0)
        
        let newVertices:Array<Vertex> = [
            A,B,C ,A,C,D,   //Front
            E,F,G ,E,G,H,   //Left
            I,J,K ,I,K,L,   //Right
            M,N,O ,M,O,P,   //Top
            Q,R,S ,Q,S,T,   //Bot
            U,V,W ,U,W,X,    //Back
        ]
        
        verticesArray.replaceSubrange(range, with: newVertices)
        update(vertices: verticesArray)
    }
    
    func isMoving() -> Bool {
        return moving
    }
}
