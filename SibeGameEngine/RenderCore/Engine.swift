//
//  Engine.swift
//  SibeGameEngine
//
//  Created by admin on 22.06.2024.
//

import MetalKit


class Engine {
    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!
    
    static func start() {
        self.device = MTLCreateSystemDefaultDevice()
        self.commandQueue = device.makeCommandQueue()
        
        ShaderLibrary.initialize()
        VertexDescriptorLibrary.initialize()
        DepthStencilStateLibrary.initialize()
        RenderPipelineDescriptorLibrary.initialize()
        RenderPipelineStateLibrary.initialize()
        MeshLibrary.initialize()
        SceneManager.initialize(Preferences.startingSceneType)
    }
}
