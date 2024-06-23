//
//  RootEventHandler.swift
//  SibeGameEngine
//
//  Created by admin on 24.06.2024.
//

import SwiftUI

class RootEventHandler {
    
    static func createEventHandlers() {
        
        //Keyboards
        NSEvent.addLocalMonitorForEvents(matching: .keyUp) { event in
            Keyboard.setKeyPressed(event.keyCode, isOn: false)
            
            return nil
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
            Keyboard.setKeyPressed(event.keyCode, isOn: true)
            
            return nil
        }
        
        //Mouse buttons
        NSEvent.addLocalMonitorForEvents(matching: .leftMouseUp) { event in
            Mouse.setMouseButtonPressed(button: .left, isOn: false)
            
            return nil
        }
        NSEvent.addLocalMonitorForEvents(matching: .leftMouseDown) { event in
            Mouse.setMouseButtonPressed(button: .left, isOn: true)
            
            return nil
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .rightMouseUp) { event in
            Mouse.setMouseButtonPressed(button: .rigth, isOn: false)
            
            return nil
        }
        NSEvent.addLocalMonitorForEvents(matching: .rightMouseDown) { event in
            Mouse.setMouseButtonPressed(button: .rigth, isOn: true)
            
            return nil
        }
    }
}
