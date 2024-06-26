//
//  DebugCamera.swift
//  SibeGameEngine
//
//  Created by Eronin Fedor NP on 24.06.2024.
//

import MetalKit

class DebugCamera: Camera {
    var cameraType: CameraType = .debug
    
    var position: Float3 = .zero
    
    var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspective(fov: 45, aspentRatio: GameViewDelegate.aspectRatio, near: 0.01, far: 1000)
    }
    
    func update(deltaTime: Float) {
        if Keyboard.isKeyPressed(.leftArrow) {
            self.position.x -= deltaTime * 20
        }
        if Keyboard.isKeyPressed(.rightArrow) {
            self.position.x += deltaTime * 20
        }
        if Keyboard.isKeyPressed(.upArrow) {
            self.position.y += deltaTime * 20
        }
        if Keyboard.isKeyPressed(.downArrow) {
            self.position.y -= deltaTime * 20
        }
    }
}
