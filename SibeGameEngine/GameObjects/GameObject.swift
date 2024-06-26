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
    private var material = CustomMaterial()
    
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
            
            firstVertexSet = false
        }
        
        renderCommandEncoder.setFragmentBytes(&material, length: MemoryLayout<CustomMaterial>.stride, index: 0)
        
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

extension GameObject {
    func setColor(_ color: Float4) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
}
