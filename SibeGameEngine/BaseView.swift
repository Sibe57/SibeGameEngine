//
//  BaseView.swift
//  SibeGameEngine
//
//  Created by admin on 21.06.2024.
//

import SwiftUI
import MetalKit

struct BaseView: NSViewRepresentable {
    typealias NSViewType = MTKView
    
    
    func makeCoordinator() -> EngineRender {
        EngineRender(self)
    }
    
    func makeNSView(context: NSViewRepresentableContext<BaseView>) -> MTKView {
        let mtkView = MTKView()
        
        mtkView.clearColor = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1)
        mtkView.colorPixelFormat = .bgra8Unorm
        
        mtkView.delegate = context.coordinator
        mtkView.preferredFramesPerSecond = 60
        mtkView.enableSetNeedsDisplay = true
        
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkView.device = metalDevice
        }
        
        mtkView.framebufferOnly = false
        mtkView.drawableSize = mtkView.frame.size
        mtkView.isPaused = false
        
        return mtkView
    }
    
    func updateNSView(_ uiView: MTKView, context: NSViewRepresentableContext<BaseView>) {
        
    }
}

#Preview {
    BaseView()
}
