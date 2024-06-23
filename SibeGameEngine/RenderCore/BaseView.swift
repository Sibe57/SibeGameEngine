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
    
    
    func makeCoordinator() -> GameViewDelegate {
        GameViewDelegate(self)
    }
    
    func makeNSView(context: NSViewRepresentableContext<BaseView>) -> MTKView {
        let mtkView = MTKView()
        
        mtkView.clearColor = Preferences.clearColor
        mtkView.colorPixelFormat = Preferences.mainPixelFormat
        
        mtkView.delegate = context.coordinator
        mtkView.preferredFramesPerSecond = 60
        mtkView.enableSetNeedsDisplay = true
        
        if let metalDevice = MTLCreateSystemDefaultDevice() {
            mtkView.device = metalDevice
        }
        
        mtkView.framebufferOnly = true
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
