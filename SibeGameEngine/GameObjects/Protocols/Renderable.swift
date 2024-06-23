//
//  Renderable.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
