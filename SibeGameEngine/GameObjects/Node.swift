//
//  Node.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit


class Node {
    var children: [Node] = .init()
    
    var position: Float3 = .init(repeating: 0)
    
    var scale: Float3 = .init(repeating: 1)
    
    var rotation: Float3 = .init(repeating: 0)
    
    var modelMatrix: matrix_float4x4 {
        //возможно улучшение
        var modelMatrix = matrix_identity_float4x4
        
        modelMatrix.translate(direction: self.position)
        
        modelMatrix.rotate(angle: rotation.x, axis: AxisType.x.rotationVector)
        modelMatrix.rotate(angle: rotation.y, axis: AxisType.y.rotationVector)
        modelMatrix.rotate(angle: rotation.z, axis: AxisType.z.rotationVector)
        //особенно с поворотами
        
        modelMatrix.scale(axis: scale)
        
        return modelMatrix
    }
    
    func addChild(_ node: Node) {
        children.append(node)
    }
    
    func update(deltaTime: Float) {
        for child in children {
            child.update(deltaTime: deltaTime)
        }
    }
    
    func render(renderEncoder: MTLRenderCommandEncoder) {
        for child in children {
            child.render(renderEncoder: renderEncoder)
        }
        
        guard let renderable = self as? Renderable else { return }
        
        renderable.doRender(renderEncoder)
    }
}
