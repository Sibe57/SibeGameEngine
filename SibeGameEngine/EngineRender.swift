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

final class EngineRender: NSObject, MTKViewDelegate {
    
    let parent: BaseView
    var metalDevice: MTLDevice!
    var metalCommandQueue: MTLCommandQueue!
    var pipelineState: MTLRenderPipelineState!
    let vertexis: [Vertex] = [
        .init(position: .init(0, 1, 0), color: .init(0, 1, 1, 1)),
        .init(position: .init(-1, -1, 0), color: .init(1, 1, 0, 1)),
        .init(position: .init(1, -1, 0), color: .init(1, 0, 1, 1))
    ]
    
    var vertexBuffer: MTLBuffer!

    
    init(_ parent: BaseView) {
        self.parent = parent
        self.metalDevice = MTLCreateSystemDefaultDevice()
        self.metalCommandQueue = metalDevice.makeCommandQueue()
        
        super.init()
        
        let pipelineDescriptor = createPipelineDescriptor()
        
        do {
            try pipelineState = metalDevice.makeRenderPipelineState(descriptor: pipelineDescriptor)
        } catch {
            print(error)
            
            fatalError()
        }
        
        createBuffer()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        guard let drawable  = view.currentDrawable else { return }
        
        let commandBuffer = metalCommandQueue.makeCommandBuffer()
        
        let renderPassDescriptor = view.currentRenderPassDescriptor
        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor!)
        renderEncoder?.setRenderPipelineState(pipelineState)
        
        renderEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: 3)
        
        
        renderEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
    private func createPipelineDescriptor() -> MTLRenderPipelineDescriptor {
        let descriptor = MTLRenderPipelineDescriptor()
        let vertexDescriptor = MTLVertexDescriptor()
        
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = MemoryLayout<SIMD3<Float>>.size
        
        vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
        
        let library =  metalDevice.makeDefaultLibrary()
        
        descriptor.vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
        descriptor.fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
        descriptor.vertexDescriptor = vertexDescriptor
        descriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        
        return descriptor
    }
    
    private func createBuffer() {
        vertexBuffer = metalDevice.makeBuffer(
            bytes: vertexis, length: MemoryLayout<Vertex>.stride * vertexis.count
        )
    }
}
