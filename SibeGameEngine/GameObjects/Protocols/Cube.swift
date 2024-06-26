//
//  Cube.swift
//  SibeGameEngine
//
//  Created by admin on 25.06.2024.
//

import MetalKit

class Cube: GameObject {
    init() {
        super.init(meshType: .cube)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.x += deltaTime
        self.rotation.y += deltaTime / 3
        super.update(deltaTime: deltaTime)
    }
}
