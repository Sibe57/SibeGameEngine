//
//  DepthStencilStateLibrary.swift
//  SibeGameEngine
//
//  Created by admin on 25.06.2024.
//

import MetalKit


enum DepthStencilStateType {
    case less
}

class DepthStencilStateLibrary {
    private static var depthStencilStates: [DepthStencilStateType: DepthStencilState] = .init()
    
    static func initialize() {
        createDefault()
    }
    
    private static func createDefault() {
        depthStencilStates[.less] = LessDepthStencilState()
    }
    
    static func getDepthStencilState(_ type: DepthStencilStateType) -> MTLDepthStencilState {
        depthStencilStates[type]!.depthStencilState
    }
}

protocol DepthStencilState {
    var depthStencilState: MTLDepthStencilState { get }
}

class LessDepthStencilState: DepthStencilState {
    var depthStencilState: MTLDepthStencilState
    
    init() {
        let depthStencilDescriptor = MTLDepthStencilDescriptor()
        depthStencilDescriptor.isDepthWriteEnabled = true
        depthStencilDescriptor.depthCompareFunction = .less
        
        depthStencilState = Engine.device.makeDepthStencilState(descriptor: depthStencilDescriptor)!
    }
}
