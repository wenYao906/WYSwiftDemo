//
//  SimpleScene.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct SimpleScene: View {
    var body: some View {
        
        TabView {
            SDHomeView()
                .tabItem {
                    Label("Home", systemImage: "person")
                }
            
            SDStoryView()
                .tabItem {
                    Label("Story", systemImage: "book")
                }
            
            SDFavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
            
            SDFunFactsView()
                .tabItem {
                    Label("Fun Facts", systemImage: "hand")
                }
        }
        
    }
}

