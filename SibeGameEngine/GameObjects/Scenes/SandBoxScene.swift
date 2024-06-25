//
//  SandBoxScene.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class SandBoxScene: CustomScene {
    let debugCamera = DebugCamera()
    override func buildScene() {
        addCamera(debugCamera)
        let count: Int = 10
        for y in -count..<count {
            for x in -count..<count {
                let pointer = Pointer(camera: debugCamera)
                
                pointer.position.y = (Float(y) + 0.5) / Float(count)
                pointer.position.x = (Float(x) + 0.5) / Float(count)
                pointer.scale = .init(repeating: 1 / Float(2 * count))
                
                addChild(pointer)
                
            }
        }
    }
    
    override func update(deltaTime: Float) {
        print(Mouse.getMouseViewportPosition())
        
        super.update(deltaTime: deltaTime)
    }
}
