//
//  Camera.swift
//  SibeGameEngine
//
//  Created by Eronin Fedor NP on 24.06.2024.
//

import MetalKit

enum CameraType {
    case debug
}

protocol Camera {
    var cameraType: CameraType { get }
    var position: Float3 { get set }
    var projectionMatrix: matrix_float4x4 { get }
    
    func update(deltaTime: Float)
}

extension Camera {
    var viewMatrix: matrix_float4x4 {
        var viewMatrix = matrix_identity_float4x4
        
        viewMatrix.translate(direction: -position)
        
        return viewMatrix
    }
}
