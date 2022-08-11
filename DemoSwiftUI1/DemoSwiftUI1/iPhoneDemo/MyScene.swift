//
//  MyScene.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/29.
//

import SwiftUI

struct MyScene: View {
    var body: some View {
//            ContentView()
            TabView {
                JournalView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
               
                SettingsView()
                   .tabItem {
                       Label("Settings", systemImage: "gear")
                   }
            }
        }
    
}

