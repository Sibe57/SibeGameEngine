//
//  Player.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class Player: GameObject {
    
    init() {
        super.init(meshType: .triangleCustom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.z = -atan2f(Mouse.getMouseViewportPosition().x - position.x, Mouse.getMouseViewportPosition().y - position.y)
        
        super.update(deltaTime: deltaTime)
    }
}
