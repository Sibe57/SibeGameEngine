//
//  InstancedGameObject.swift
//  SibeGameEngine
//
//  Created by admin on 26.06.2024.
//

import MetalKit

class InstancedGameObject: Node {
    var material = CustomMaterial()
    
    var nodes: [Node] = .init()
    private var modelConstants: [ModelConstants] = .init()
    private var modelConstantBuffer: MTLBuffer!
    private var mesh: Mesh
    
    
    init(meshType: MeshLibrary.MeshType, instanceCount: Int) {
        self.mesh = MeshLibrary.mesh(.cube)
        self.mesh.setInstancesCount(count: instanceCount)
        super.init()
        self.generateInstances(count: instanceCount)
        self.createBuffers(count: instanceCount)
    }
    
    func generateInstances(count: Int) {
        for _ in 0..<count {
            let node = Node()
            
            nodes.append(node)
            modelConstants.append(ModelConstants())
        }
    }
    
    func createBuffers(count: Int) {
        let length = MemoryLayout<ModelConstants>.stride * count
        modelConstantBuffer = Engine.device.makeBuffer(length: length)
    }
    
    private func updateModelConstantsBuffer() {
        var pointer = modelConstantBuffer.contents().bindMemory(to: ModelConstants.self, capacity: modelConstants.count)
        
        for node in nodes {
            pointer.pointee.modelMatrix = matrix_multiply(self.modelMatrix, node.modelMatrix)
            
            pointer = pointer.successor()
        }
    }
    
    override func update(deltaTime: Float) {
        updateModelConstantsBuffer()
        
        super.update(deltaTime: deltaTime)
    }
}


extension InstancedGameObject: Renderable {
    func doRender(_ renderCommandEncoder: any MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.instanced))
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.getDepthStencilState(.less))
        
        renderCommandEncoder.setVertexBuffer(modelConstantBuffer, offset: 0, index: 2)
        
        renderCommandEncoder.setFragmentBytes(&material, length: MemoryLayout<CustomMaterial>.stride, index: 0)
        
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

extension InstancedGameObject {
    func setColor(_ color: Float4) {
        self.material.color = color
        self.material.useMaterialColor = true
    }
}


