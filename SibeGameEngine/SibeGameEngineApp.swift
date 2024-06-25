//
//  SibeGameEngineApp.swift
//  SibeGameEngine
//
//  Created by admin on 21.06.2024.
//

import SwiftUI
import SwiftData

@main
struct SibeGameEngineApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                BaseView()
            }
            .onAppear {
                RootEventHandler.createEventHandlers()
            }
        }
    }
}
