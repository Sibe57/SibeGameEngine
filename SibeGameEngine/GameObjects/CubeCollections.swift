//
//  CubeCollections.swift
//  SibeGameEngine
//
//  Created by admin on 26.06.2024.
//

import MetalKit

class CubeCollections: InstancedGameObject {
    var cubesWide: Int
    var cubesHigh: Int
    var cubesBack: Int
    
    var time: Float = .zero
    
    init(cubesWide: Int, cubesHigh: Int, cubesBack: Int) {
        self.cubesWide = cubesWide
        self.cubesHigh = cubesHigh
        self.cubesBack = cubesBack
        
        super.init(meshType: .cube, instanceCount: cubesBack * cubesWide * cubesHigh)
        
        print(cubesBack * cubesWide * cubesHigh)
        
        setColor(Float4(0.5, 0.8, 0.43, 1))
    }
    
    override func update(deltaTime: Float) {
        time += deltaTime
        
        let halfWide: Float = Float(cubesWide / 2)
        let halfHigh: Float = Float(cubesHigh / 2)
        let halfBack: Float = Float(cubesBack / 2)
        
        var index: Int = .zero
        
        let gap: Float = cos(time / 2) * 10
        
        for y in stride(from: -halfHigh, to: halfHigh, by: 1.0) {
            let posY = Float(y * gap)
            
            for x in stride(from: -halfWide, to: halfWide, by: 1.0) {
                let posX = Float(x * gap)
                
                for z in stride(from: -halfBack, to: halfBack, by: 1.0) {
                    let posZ = Float(z * gap)
                    
                    nodes[index].position.y = posY
                    nodes[index].position.x = posX
                    nodes[index].position.z = posZ
                    
                    nodes[index].rotation.z -= deltaTime * 2
                    nodes[index].rotation.y -= deltaTime * 2
                    
                    nodes[index].scale = Float3(repeating: 0.3)
                    
                    index += 1
                }
            }
        }
        super.update(deltaTime: deltaTime)
    }
}


