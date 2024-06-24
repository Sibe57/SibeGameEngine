//
//  SandBoxScene.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

class SandBoxScene: CustomScene {
    override func buildScene() {
        let count: Int = 10
        for y in -count..<count {
            for x in -count..<count {
                let player = Player()
                
                player.position.y = (Float(y) + 0.5) / Float(count)
                player.position.x = (Float(x) + 0.5) / Float(count)
                player.scale = .init(repeating: 1 / Float(2 * count))
                
                addChild(player)
                
            }
        }
    }
    
    override func update(deltaTime: Float) {
        print(Mouse.getMouseViewportPosition())
        
        super.update(deltaTime: deltaTime)
    }
}
