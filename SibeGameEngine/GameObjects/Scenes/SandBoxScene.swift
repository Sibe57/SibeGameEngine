//
//  SandBoxScene.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class SandBoxScene: CustomScene {
    let debugCamera = DebugCamera()
    let cubeCollection = CubeCollections(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
    let cubeCollection2 = CubeCollections(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
    
    override func buildScene() {
        addCamera(debugCamera)
        debugCamera.position.z = 100
                
        addCubes()
                
    }

    func addCubes() {
        addChild(cubeCollection)
        cubeCollection.position.x = -16
        cubeCollection2.position.x = 16
        addChild(cubeCollection2)
    }
    
    override func update(deltaTime: Float) {
        cubeCollection.rotation.z += deltaTime
        cubeCollection2.rotation.z -= deltaTime
        
        super.update(deltaTime: deltaTime)
    }
}
