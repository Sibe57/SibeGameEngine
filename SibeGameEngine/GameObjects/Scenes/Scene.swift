//
//  Scene.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class CustomScene: Node {
    var cameraManager = CameraManager()
    var sceneConstants = SceneConstants()
    
    override init() {
        super.init()
        buildScene()
    }
    
    func buildScene() {
        
    }
    
    func addCamera(_ camera: Camera, isCurrentCamera: Bool = true) {
        cameraManager.registerCamera(camera: camera)
        
        if isCurrentCamera {
            cameraManager.setCamera(camera.cameraType)
        }
    }
    
    func updateSceneConstants() {
        sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
    }
    
    func updateCameras(deltaTime: Float) {
        cameraManager.update(deltaTime: deltaTime)
    }
    
    override func update(deltaTime: Float) {
        updateCameras(deltaTime: deltaTime)
        updateSceneConstants()
        super.update(deltaTime: deltaTime)
    }
    
    override func render(renderEncoder: any MTLRenderCommandEncoder) {
        renderEncoder.setVertexBytes(
            &sceneConstants,
            length: MemoryLayout<SceneConstants>.stride,
            index: 1
        )
        
        super.render(renderEncoder: renderEncoder)
    }
}
