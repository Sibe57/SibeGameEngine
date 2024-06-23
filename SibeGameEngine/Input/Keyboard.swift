//
//  Keyboard.swift
//  SibeGameEngine
//
//  Created by admin on 23.06.2024.
//

import Foundation

class Keyboard {
    private static var keys: [UInt16: Bool] = .init()
    
    static func setKeyPressed(_ keyCode: UInt16, isOn: Bool) {
        keys[keyCode] = isOn
    }
    
    static func isKeyPressed(_ keyCode: Keycode) -> Bool {
        keys[keyCode.rawValue, default: false]
    }
}
