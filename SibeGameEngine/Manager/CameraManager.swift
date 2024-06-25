//
//  CameraManager.swift
//  SibeGameEngine
//
//  Created by Eronin Fedor NP on 25.06.2024.
//

import Foundation


class CameraManager {
    private var cameras: [CameraType: Camera] = [:]
    
    var currentCamera: Camera!
    
    func registerCamera(camera: Camera) {
        self.cameras[camera.cameraType] = camera
    }
    
    func setCamera(_ type: CameraType) {
        currentCamera = cameras[type]
    }
    
    func update(deltaTime: Float) {
        for camera in cameras.values {
            camera.update(deltaTime: deltaTime)
        }
    }
}
