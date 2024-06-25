//
//  GameObject.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit
var firstVertexSet: Bool = true

class GameObject: Node {
    
    var modelConstant = ModelConstants()
    
    let mesh: Mesh
    
    init(meshType: MeshLibrary.MeshType) {
        mesh = MeshLibrary.mesh(meshType)
    }
    
    override func update(deltaTime: Float) {
        updateModelConstant()
    }
    
    private func updateModelConstant() {
        modelConstant.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: any MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&modelConstant, length: MemoryLayout<ModelConstants>.stride, index: 2)
        
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.getDepthStencilState(.less))
        if firstVertexSet {
            renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.basic))
            
            renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
            
            firstVertexSet = false
        }
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}

struct ModelConstants {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}
