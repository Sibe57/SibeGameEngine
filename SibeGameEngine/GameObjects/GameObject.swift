//
//  GameObject.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit


class GameObject: Node {
    
    let mesh: Mesh
    
    init(meshType: MeshLibrary.MeshType) {
        mesh = MeshLibrary.mesh(meshType)
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: any MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.basic))
        
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
