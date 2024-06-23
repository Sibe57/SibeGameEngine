//
//  Node.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit


class Node {
    func render(renderEncoder: MTLRenderCommandEncoder) {
        guard let renderable = self as? Renderable else { return }
        
        renderable.doRender(renderEncoder)
    }
}
