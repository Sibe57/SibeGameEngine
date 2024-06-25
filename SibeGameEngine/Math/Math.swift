//
//  Math.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import MetalKit

enum AxisType {
    case x
    case y
    case z
    
    var rotationVector: Float3 {
        return switch self {
        case .x:
                .init(1,0,0)
        case .y:
                .init(0,1,0)
        case .z:
                .init(0,0,1)
        }
    }
}

extension matrix_float4x4 {
    mutating func translate(direction: Float3) {
        let translationMatrix = matrix_float4x4(
            Float4(1, 0, 0, 0),
            Float4(0, 1, 0, 0),
            Float4(0, 0, 1, 0),
            Float4(direction, 1)
        )
        
        self = matrix_multiply(self, translationMatrix)
    }
    
    
    mutating func scale(axis: Float3) {
        let translationMatrix = matrix_float4x4(
            Float4(axis.x, 0, 0, 0),
            Float4(0, axis.y, 0, 0),
            Float4(0, 0, axis.z, 0),
            Float4(0, 0, 0, 1)
        )
        
        self = matrix_multiply(self, translationMatrix)
    }
    
    mutating func rotate(angle: Float, axis: Float3) {
        let x = axis.x
        let y = axis.y
        let z = axis.z
        
        let cos = cos(angle)
        let sin = sin(angle)
        let negativeCos = 1 - cos
        
        let r1c1 = x * x * negativeCos + cos
        let r2c1 = x * y * negativeCos + z * sin
        let r3c1 = x * z * negativeCos - y * sin
        
        let r1c2 = y * x * negativeCos - z * sin
        let r2c2 = y * y * negativeCos + cos
        let r3c2 = y * z * negativeCos + x * sin
        
        let r1c3 = z * x * negativeCos + y * sin
        let r2c3 = z * y * negativeCos - x * sin
        let r3c3 = z * z * negativeCos + cos
        
        let translationMatrix = matrix_float4x4(
            Float4(r1c1, r2c1, r3c1, 0),
            Float4(r1c2, r2c2, r3c2, 0),
            Float4(r1c3, r2c3, r3c3, 0),
            Float4(0, 0, 0, 1)
        )
        
        self = matrix_multiply(self, translationMatrix)
    }
    
    static func perspective(fov: Float, aspentRatio: Float, near: Float, far: Float) -> matrix_float4x4 {
        let fov = fov.toRadians
        
        let t: Float = tan(fov / 2)
        
        let x: Float = 1 / (aspentRatio * t)
        let y: Float = 1 / t
        let z: Float = -((far + near) / (far - near))
        let w: Float = -((2 * far * near) / (far - near))
        
        return matrix_float4x4(
            Float4(x, 0, 0, 0),
            Float4(0, y, 0, 0),
            Float4(0, 0, z, -1),
            Float4(0, 0, w, 0)
        )
    }
}

extension Float {
    var toRadians: Float {
        return self / 180 * .pi
    }
    
    var toDegrees: Float {
        return self * (180 / .pi)
    }
}
