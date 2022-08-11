//
//  MyAlternativeScene.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/29.
//

import SwiftUI

struct MyAlternativeScene: Scene {
    var body: some Scene {
        WindowGroup {
            AlternativeContentView()
        }
        
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}

