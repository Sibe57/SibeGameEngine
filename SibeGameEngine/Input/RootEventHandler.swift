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
            
            return event
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .keyDown) { event in
            Keyboard.setKeyPressed(event.keyCode, isOn: true)
            
            return event
        }
        
        //Mouse buttons
        NSEvent.addLocalMonitorForEvents(matching: .leftMouseUp) { event in
            Mouse.setMouseButtonPressed(button: .left, isOn: false)
            
            return event
        }
        NSEvent.addLocalMonitorForEvents(matching: .leftMouseDown) { event in
            Mouse.setMouseButtonPressed(button: .left, isOn: true)
            
            return event
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .rightMouseUp) { event in
            Mouse.setMouseButtonPressed(button: .rigth, isOn: false)
            
            return event
        }
        NSEvent.addLocalMonitorForEvents(matching: .rightMouseDown) { event in
            Mouse.setMouseButtonPressed(button: .rigth, isOn: true)
            return event
        }
        
        //Mouse cursor
        NSEvent.addLocalMonitorForEvents(matching: .mouseMoved) { event in
            guard event.window != nil else { return event }
     
            Mouse.setMousePositionChange(
                overallPosition: event.locationInWindow,
                deltaPosition: .init(Float(event.deltaX), Float(event.deltaY))
            )
            
            return event
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .scrollWheel) { event in
            Mouse.scrollMouse(deltaY: Float(event.deltaY))
            
            return event
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .leftMouseDragged) { event in
            Mouse.setOverallMousePosition(position: event.locationInWindow)
            
            return event
        }
        
        NSEvent.addLocalMonitorForEvents(matching: .rightMouseDragged) { event in
            Mouse.setOverallMousePosition(position: event.locationInWindow)
            
            return event
        }
    }
}
