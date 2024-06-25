//
//  SandBoxScene.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class SandBoxScene: CustomScene {
    let debugCamera = DebugCamera()
    let cube = Cube()
    override func buildScene() {
        addCamera(debugCamera)
        debugCamera.position.z = 5
                
        addChild(cube)
                
    }
    
    override func update(deltaTime: Float) {
        print(Mouse.getMouseViewportPosition())
        cube.rotation.x += deltaTime
        cube.rotation.y += deltaTime
        
        super.update(deltaTime: deltaTime)
    }
}
