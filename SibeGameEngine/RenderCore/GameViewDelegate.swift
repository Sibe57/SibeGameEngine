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
    var gameObjects: [Node] = .init()
    
    init(_ parent: BaseView) {
        Engine.start()
        
        self.parent = parent
        
        gameObjects.append(Player())
        
        super.init()
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) { }
    
    func draw(in view: MTKView) {
        guard let drawable  = view.currentDrawable else { return }
        
        let commandBuffer = Engine.commandQueue.makeCommandBuffer()
        
        let renderPassDescriptor = view.currentRenderPassDescriptor
        let renderEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor!)
        
        for gameObject in gameObjects {
            gameObject.render(renderEncoder: renderEncoder!)
        }
        
        renderEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
