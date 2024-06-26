//
//  Types.swift
//  SibeGameEngine
//
//  Created by admin on 25.06.2024.
//

import MetalKit

struct ModelConstants {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}


struct CustomMaterial {
    var color: Float4 = .init(0.8, 0.5, 0, 1)
    var useMaterialColor: Bool = false
}
