//
//  Player.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class Pointer: GameObject {
    private var camera: Camera
    
    init(camera: Camera) {
        self.camera = camera
        super.init(meshType: .triangleCustom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(
            Mouse.getMouseViewportPosition().x - position.x + camera.position.x,
            Mouse.getMouseViewportPosition().y - position.y + camera.position.y
        )
        
        super.update(deltaTime: deltaTime)
    }
}
