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
    }
    
    static private var meshes: [MeshType: Mesh] = .init()
    
    static func initialize() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes[.triangleCustom] = TriangleMesh()
        meshes[.quadCustom] = QuadMesh()
    }
    
    static func mesh(_ meshType: MeshType) -> Mesh {
        meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int { get }
}

class CustomMesh: Mesh {
    var vertexis: [Vertex] = .init()
    var vertexBuffer: (any MTLBuffer)!
    
    var vertexCount: Int {
        vertexis.count
    }
    
    init() {
        createVertexies()
        createBuffer()
    }
    
    func createVertexies() { }
    
    private func createBuffer() {
        vertexBuffer = Engine.device.makeBuffer(
            bytes: vertexis, length: MemoryLayout<Vertex>.stride * vertexis.count
        )
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
            .init(position: .init(0.5, 0.5, 0), color: .init(0, 1, 1, 1)),
            .init(position: .init(-0.5, 0.5, 0), color: .init(1, 1, 0, 1)),
            .init(position: .init(-0.5, -0.5, 0), color: .init(1, 0, 1, 1)),
            
            .init(position: .init(0.5, 0.5, 0), color: .init(0, 1, 1, 1)),
            .init(position: .init(-0.5, -0.5, 0), color: .init(1, 0, 1, 1)),
            .init(position: .init(0.5, -0.5, 0), color: .init(1, 1, 0, 1))
        ]
    }
}


