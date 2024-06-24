//
//  Mouse.swift
//  SibeGameEngine
//
//  Created by admin on 24.06.2024.
//

import Foundation


enum MouseButtonCodes: Int {
    case left
    case rigth
    case center
}

class Mouse {
    private static var mouseButtonStates: [Int: Bool] = .init()
    private static var overalMousePosition: Float2 = .init(repeating: 0)
    private static var mousePositionDelta: Float2 = .init(repeating: 0)
    private static var scrollWhelPosition: Float = .zero
    private static var lastWheelChange: Float = .zero
    private static var scrollWheelChange: Float = .zero
    
    static func setMouseButtonPressed(button: MouseButtonCodes, isOn: Bool) {
        mouseButtonStates[button.rawValue] = isOn
    }
    
    static func isMouseButtonPressed(button: MouseButtonCodes) -> Bool {
        return mouseButtonStates[button.rawValue, default: false]
    }
    
    static func setOverallMousePosition(position: Float2) {
        self.overalMousePosition = position
    }
    
    static func setMousePositionChange(overallPosition: Float2, deltaPosition: Float2) {
        self.overalMousePosition = overallPosition
        self.mousePositionDelta += deltaPosition
    }
    
    static func scrollMouse(deltaY: Float) {
        scrollWhelPosition += deltaY
        scrollWheelChange += deltaY
    }
    
    static func getMouseWindowPosition() -> Float2 {
        overalMousePosition
    }
    
    static func getDWheel() -> Float {
        let position = scrollWheelChange
        
        scrollWheelChange = .zero
        
        return position
    }
    
    static func getDY() -> Float {
        let result = mousePositionDelta.y
        
        mousePositionDelta.y = .zero
        
        return result
    }
    
    static func getDX() -> Float {
        let result = mousePositionDelta.x
        
        mousePositionDelta.x = .zero
        
        return result
    }
    
    static func getMouseViewportPosition() -> Float2 {
        let x = (overalMousePosition.x - GameViewDelegate.viewSize.x * 0.5) / (GameViewDelegate.viewSize.x * 0.5)
        let y = (overalMousePosition.y - GameViewDelegate.viewSize.y * 0.5) / (GameViewDelegate.viewSize.y * 0.5)
        
        return .init(x, y)
    }
    
}
