//
//  BufferProvider.swift
//  Wizard_Duels
//
//  Created by Roslyn Patrick-Sunnes on 2/22/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation
import Metal

class BufferProvider {
    // 1
    let inflightBuffersCount: Int
    // 2
    fileprivate var uniformsBuffers: [MTLBuffer]
    // 3
    fileprivate var avaliableBufferIndex: Int = 0
    
    var avaliableResourcesSemaphore:DispatchSemaphore
    
    init(device:MTLDevice, inflightBuffersCount: Int, sizeOfUniformsBuffer: Int){
        
        avaliableResourcesSemaphore = DispatchSemaphore(value: inflightBuffersCount)
        
        self.inflightBuffersCount = inflightBuffersCount
        uniformsBuffers = [MTLBuffer]()
        
        for _ in 0...inflightBuffersCount-1 {
            let uniformsBuffer = device.makeBuffer(length: sizeOfUniformsBuffer, options: [])
            uniformsBuffers.append(uniformsBuffer)
        }
    }
    
    deinit{
        for _ in 0...self.inflightBuffersCount{
            self.avaliableResourcesSemaphore.signal()
        }
    }
    
    func nextUniformsBuffer(_ projectionMatrix: Matrix4, modelViewMatrix: Matrix4) -> MTLBuffer {
        
        // 1
        let buffer = uniformsBuffers[avaliableBufferIndex]
        
        // 2
        let bufferPointer = buffer.contents()
        
        // 3
        memcpy(bufferPointer, modelViewMatrix.raw(), MemoryLayout<Float>.size*Matrix4.numberOfElements())
        memcpy(bufferPointer + MemoryLayout<Float>.size*Matrix4.numberOfElements(), projectionMatrix.raw(), MemoryLayout<Float>.size*Matrix4.numberOfElements())
        
        // 4
        avaliableBufferIndex += 1
        if avaliableBufferIndex == inflightBuffersCount{
            avaliableBufferIndex = 0
        } 
        
        return buffer
    }
    
}
