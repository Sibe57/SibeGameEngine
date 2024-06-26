//
//  Libraries.swift
//  SibeGameEngine
//
//  Created by admin on 22.06.2024.
//

import MetalKit

class Shader {
    var name: String
    var functionName: String
    var function: MTLFunction
    
    init() {
        self.name = String(describing: Self.self)
        self.functionName = name.lowerSnakeCased()
        
        let function: MTLFunction = ShaderLibrary.defaultLibrary.makeFunction(name: functionName)!
        
        function.label = name
        
        self.function = function
    }
}

private final class BasicVertexShader: Shader { }

private final class BasicFragmentShader: Shader { }

private final class InstancedVertexShader: Shader { }

final class ShaderLibrary {
    enum VertexShaderType {
        case basic
        case instanced
    }

    enum FragmentShaderType {
        case basic
    }
    
    static var defaultLibrary: MTLLibrary!
    
    private static var vertexShaders: [VertexShaderType: Shader] = .init()
    private static var fragmentShaders: [FragmentShaderType: Shader] = .init()
    
    static func initialize() {
        defaultLibrary = Engine.device.makeDefaultLibrary()!
        createDefaultShaders()
    }
    
    static func vertex(_ vertexShaderType: VertexShaderType) -> MTLFunction {
        vertexShaders[vertexShaderType]!.function
    }
    
    static func fragment(_ fragmentShaderType: FragmentShaderType) -> MTLFunction {
        fragmentShaders[fragmentShaderType]!.function
    }
    
    private static func createDefaultShaders() {
        vertexShaders[.basic] = BasicVertexShader()
        fragmentShaders[.basic] = BasicFragmentShader()
        vertexShaders[.instanced] = InstancedVertexShader()
        
    }
}
