//
//  SceneManager.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class SceneManager {
    enum SceneType {
        case sandbox
    }
    
    private static var currentScene: CustomScene!
    
    static func initialize(_ sceneType: SceneType) {
        setScene(sceneType)
    }
    
    static func setScene(_ sceneType: SceneType) {
        switch sceneType {
        case .sandbox:
            currentScene = SandBoxScene()
        }
    }
    
    static func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        currentScene.updateCameras(deltaTime: deltaTime)
        currentScene.update(deltaTime: deltaTime)
        currentScene.render(renderEncoder: renderCommandEncoder)
    }
}
