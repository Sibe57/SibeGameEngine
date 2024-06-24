//
//  EngineRender.swift
//  SibeGameEngine
//
//  Created by admin on 21.06.2024.
//

import MetalKit


struct Vertex {
    var position: Float3
    var color: Float4
}

final class GameViewDelegate: NSObject, MTKViewDelegate {
    static var viewSize: Float2 = .zero
    
    init(_ parent: BaseView) {
        Engine.start()
        
        super.init()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        Self.viewSize = .init(Float(size.width), Float(size.height))
    }
    
    func draw(in view: MTKView) {
        firstVertexSet = true
        guard let drawable  = view.currentDrawable else { return }
        
        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        
        let renderPassDescriptor = view.currentRenderPassDescriptor
        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor!)
        
        let deltaTime = Float(1) / Float(view.preferredFramesPerSecond)
        
        SceneManager.tickScene(renderCommandEncoder: renderEncoder!, deltaTime: deltaTime)

        renderEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
