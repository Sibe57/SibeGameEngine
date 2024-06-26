//
//  MeshLibrary.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit


class MeshLibrary {
    
    enum MeshType {
        case triangleCustom
        case quadCustom
        case cube
    }
    
    static private var meshes: [MeshType: Mesh] = .init()
    
    static func initialize() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes[.triangleCustom] = TriangleMesh()
        meshes[.quadCustom] = QuadMesh()
        meshes[.cube] = CubeMesh()
    }
    
    static func mesh(_ meshType: MeshType) -> Mesh {
        meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int { get }
    func setInstancesCount(count: Int)
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

class CustomMesh: Mesh {
    var vertexis: [Vertex] = .init()
    var vertexBuffer: (any MTLBuffer)!
    var instancesCount: Int = 1
    
    var vertexCount: Int {
        vertexis.count
    }
    
    init() {
        createVertexies()
        createBuffer()
    }
    
    func createVertexies() { }
    
    func setInstancesCount(count: Int) {
        instancesCount = count
    }
    
    private func createBuffer() {
        vertexBuffer = Engine.device.makeBuffer(
            bytes: vertexis, length: MemoryLayout<Vertex>.stride * vertexis.count
        )
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
//        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertexCount)
        
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertexCount, instanceCount: instancesCount)
    }
}

final class TriangleMesh: CustomMesh {
    override func createVertexies() {
        self.vertexis = [
            .init(position: .init(0, 1, 0), color: .init(0, 1, 1, 1)),
            .init(position: .init(-1, -1, 0), color: .init(1, 1, 0, 1)),
            .init(position: .init(1, -1, 0), color: .init(1, 0, 1, 1))
        ]
    }
}

final class QuadMesh: CustomMesh {
    override func createVertexies() {
        self.vertexis = [
            .init(position: .init(1, 1, 0), color: .init(0, 1, 1, 1)),
            .init(position: .init(-1, 1, 0), color: .init(1, 1, 0, 1)),
            .init(position: .init(-1, -1, 0), color: .init(1, 0, 1, 1)),
            
            .init(position: .init(1, 1, 0), color: .init(0, 1, 1, 1)),
            .init(position: .init(-1, -1, 0), color: .init(1, 0, 1, 1)),
            .init(position: .init(1, -1, 0), color: .init(1, 1, 0, 1))
        ]
    }
}

final class CubeMesh: CustomMesh {
    override func createVertexies() {
        self.vertexis = [
            //Left
            Vertex(position: Float3(-1.0,-1.0,-1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: Float3(-1.0,-1.0, 1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0, 1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: Float3(-1.0,-1.0,-1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0, 1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0,-1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            
            //RIGHT
            Vertex(position: Float3( 1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 0.5, 1.0)),
            Vertex(position: Float3( 1.0,-1.0,-1.0), color: Float4(1.0, 0.0, 0.5, 1.0)),
            Vertex(position: Float3( 1.0, 1.0,-1.0), color: Float4(1.0, 0.0, 0.5, 1.0)),
            Vertex(position: Float3( 1.0,-1.0,-1.0), color: Float4(1.0, 0.0, 0.5, 1.0)),
            Vertex(position: Float3( 1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 0.5, 1.0)),
            Vertex(position: Float3( 1.0,-1.0, 1.0), color: Float4(1.0, 0.0, 0.5, 1.0)),
            
            //TOP
            Vertex(position: Float3( 1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: Float3( 1.0, 1.0,-1.0), color: Float4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0,-1.0), color: Float4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: Float3( 1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0,-1.0), color: Float4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 0.0, 1.0)),
            
            //BOTTOM
            Vertex(position: Float3( 1.0,-1.0, 1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: Float3(-1.0,-1.0,-1.0), color: Float4(0.5, 1.0, 0.0, 1.0)),
            Vertex(position: Float3( 1.0,-1.0,-1.0), color: Float4(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: Float3( 1.0,-1.0, 1.0), color: Float4(1.0, 1.0, 0.5, 1.0)),
            Vertex(position: Float3(-1.0,-1.0, 1.0), color: Float4(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: Float3(-1.0,-1.0,-1.0), color: Float4(1.0, 0.5, 1.0, 1.0)),
            
            //BACK
            Vertex(position: Float3( 1.0, 1.0,-1.0), color: Float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: Float3(-1.0,-1.0,-1.0), color: Float4(0.5, 1.0, 0.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0,-1.0), color: Float4(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: Float3( 1.0, 1.0,-1.0), color: Float4(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: Float3( 1.0,-1.0,-1.0), color: Float4(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: Float3(-1.0,-1.0,-1.0), color: Float4(1.0, 0.5, 1.0, 1.0)),
            
            //FRONT
            Vertex(position: Float3(-1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 1.0, 1.0)),
            Vertex(position: Float3(-1.0,-1.0, 1.0), color: Float4(1.0, 0.0, 1.0, 1.0)),
            Vertex(position: Float3( 1.0,-1.0, 1.0), color: Float4(1.0, 0.0, 1.0, 1.0)),
            Vertex(position: Float3( 1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 1.0, 1.0)),
            Vertex(position: Float3(-1.0, 1.0, 1.0), color: Float4(1.0, 0.0, 1.0, 1.0)),
            Vertex(position: Float3( 1.0,-1.0, 1.0), color: Float4(1.0, 0.0, 1.0, 1.0))
        ]
    }
}


