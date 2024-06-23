//
//  VertexDescriptorLibrary.swift
//  SibeGameEngine
//
//  Created by admin on 22.06.2024.
//

import MetalKit


class VertexDescriptorLibrary {
    
    enum VertexDescriptorType {
        case basic
    }
    
    private static var vertexDescriptors: [VertexDescriptorType: VertexDescriptor] = .init()
    
    static func initialize() {
        createDefaultVertexDescriptor()
    }
    
    static func createDefaultVertexDescriptor() {
        vertexDescriptors[.basic] = BasicVertexDescriptor()
    }
    
    static func descriptor(_ vertexDescriptorType: VertexDescriptorType) -> MTLVertexDescriptor {
        vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
    }
}

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor { get }
}

struct BasicVertexDescriptor: VertexDescriptor {
    let name: String
    let vertexDescriptor: MTLVertexDescriptor
    
    init() {
        self.name = String(describing: Self.self)
        
        let vertexDescriptor = MTLVertexDescriptor()
        
        vertexDescriptor.attributes[0].format = .float3
        vertexDescriptor.attributes[0].bufferIndex = 0
        vertexDescriptor.attributes[0].offset = 0
        vertexDescriptor.attributes[1].format = .float4
        vertexDescriptor.attributes[1].bufferIndex = 0
        vertexDescriptor.attributes[1].offset = MemoryLayout<SIMD3<Float>>.size
        vertexDescriptor.layouts[0].stride = MemoryLayout<Vertex>.stride
        
        self.vertexDescriptor = vertexDescriptor
    }
}
