//
//  DebugCamera.swift
//  SibeGameEngine
//
//  Created by Eronin Fedor NP on 24.06.2024.
//

import Foundation

class DebugCamera: Camera {
    var cameraType: CameraType = .debug
    
    var position: Float3 = .zero
    
    func update(deltaTime: Float) {
        if Keyboard.isKeyPressed(.leftArrow) {
            self.position.x -= deltaTime
        }
        if Keyboard.isKeyPressed(.rightArrow) {
            self.position.x += deltaTime
        }
        if Keyboard.isKeyPressed(.upArrow) {
            self.position.y += deltaTime
        }
        if Keyboard.isKeyPressed(.downArrow) {
            self.position.y -= deltaTime
        }
    }
}
