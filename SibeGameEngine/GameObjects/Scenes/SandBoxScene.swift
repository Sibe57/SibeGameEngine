//
//  SandBoxScene.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class SandBoxScene: CustomScene {
    override func buildScene() {
        for y in -5..<5 {
            for x in -5..<5 {
                let player = Player()
                
                player.position.y = (Float(y) + 0.5) / 5
                player.position.x = (Float(x) + 0.5) / 5
                player.scale = .init(repeating: 0.09)
                
                addChild(player)
                
            }
        }
    }
    
    override func update(deltaTime: Float) {
        let child = children.first!
        if Mouse.isMouseButtonPressed(button: .left) {
            child.position.x += deltaTime
        }
        
        if Mouse.isMouseButtonPressed(button: .rigth) {
            child.position.x -= deltaTime
        }
        
        super.update(deltaTime: deltaTime)
    }
}
