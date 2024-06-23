//
//  EngineRender.swift
//  SibeGameEngine
//
//  Created by admin on 21.06.2024.
//

import MetalKit


struct Vertex {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}

final class GameViewDelegate: NSObject, MTKViewDelegate {
    
    let parent: BaseView
    
    let vertexis: [Vertex] = [
        .init(position: .init(0, 1, 0), color: .init(0, 1, 1, 1)),
        .init(position: .init(-1, -1, 0), color: .init(1, 1, 0, 1)),
        .init(position: .init(1, -1, 0), color: .init(1, 0, 1, 1))
    ]
    
    var vertexBuffer: MTLBuffer!

    
    init(_ parent: BaseView) {
        self.parent = parent
        
        Engine.start()
        
        super.init()
        
        createBuffer()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        guard let drawable  = view.currentDrawable else { return }
        
        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        
        let renderPassDescriptor = view.currentRenderPassDescriptor
        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor!)
        renderEncoder?.setRenderPipelineState(RenderPipelineStateLibrary.pipelineState(.basic))
        
        renderEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        
        
        renderEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
    private func createBuffer() {
        vertexBuffer = Engine.device.makeBuffer(
            bytes: vertexis, length: MemoryLayout<Vertex>.stride * vertexis.count
        )
    }
}
