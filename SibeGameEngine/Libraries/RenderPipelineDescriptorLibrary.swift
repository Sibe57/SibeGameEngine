//
//  RenderPipelineDescriptorLibrary.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

enum RenderPipelineDescriptorType {
    case basic
}

class RenderPipelineDescriptorLibrary {
    private static var renderPipelineDescriptors: [RenderPipelineDescriptorType : RenderPipelineDescriptor] = [:]
    
    static func initialize() {
        createDefaultRenderPipelineDescriptors()
    }

    private static func createDefaultRenderPipelineDescriptors() {
        renderPipelineDescriptors[.basic] = BasicRenderPipelineDescriptor()
    }
    
    public static func descriptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorType) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[renderPipelineDescriptorType]!.renderPipelineDescriptor
    }
}

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

public struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    let name: String
    let renderPipelineDescriptor: MTLRenderPipelineDescriptor
    
    init() {
        self.name = String(describing: Self.self)
        
        let descriptor = MTLRenderPipelineDescriptor()
        
        descriptor.vertexDescriptor = VertexDescriptorLibrary.descriptor(.basic)
        descriptor.vertexFunction = ShaderLibrary.vertex(.basic)
        descriptor.fragmentFunction = ShaderLibrary.fragment(.basic)
        descriptor.colorAttachments[0].pixelFormat = Preferences.mainPixelFormat
        
        self.renderPipelineDescriptor = descriptor
    }
}
