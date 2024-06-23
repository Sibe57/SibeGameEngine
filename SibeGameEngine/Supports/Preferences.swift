//
//  Preferences.swift
//  SibeGameEngine
//
//  Created by admin on 22.06.2024.
//

import MetalKit


enum ClearColor {
    case white
    case green
    case gray
    case black
    
    var mtlColor: MTLClearColor {
        return switch self {
        case .white:
                .init(red: 1, green: 1, blue: 1, alpha: 1)
        case .green:
                .init(red: 0.22, green: 0.55, blue: 0.34, alpha: 1)
        case .gray:
                .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        case .black:
                .init(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}

class Preferences {
    static var clearColor: MTLClearColor = ClearColor.white.mtlColor
    
    static var mainPixelFormat: MTLPixelFormat = MTLPixelFormat.bgra8Unorm
    
    static var startingSceneType: SceneManager.SceneType = .sandbox
    
}
