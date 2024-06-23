//
//  RenderPipelineStateLibrary.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

enum RenderPipelineStateType {
    case basic
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates: [RenderPipelineStateType: RenderPipelineState] = .init()
    
    static func initialize() {
        createDefaultRenderPipelineState()
    }

    private static func createDefaultRenderPipelineState() {
        renderPipelineStates[.basic] = BasicRenderPipelineState()
    }

    static func pipelineState(_ renderPipelineStateType: RenderPipelineStateType) -> MTLRenderPipelineState {
        renderPipelineStates[renderPipelineStateType]!.renderPipelineState
    }
}

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

struct BasicRenderPipelineState: RenderPipelineState {
    let name: String
    let renderPipelineState: any MTLRenderPipelineState
    
    init() {
        self.name = String(describing: Self.self)
        
        do {
            self.renderPipelineState = try Engine.device.makeRenderPipelineState(
                descriptor: RenderPipelineDescriptorLibrary.descriptor(.basic)
            )
        } catch {
            print(error)
            
            fatalError()
        }
    }
}
