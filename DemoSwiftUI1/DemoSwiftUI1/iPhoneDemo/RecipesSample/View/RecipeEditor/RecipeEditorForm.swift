//
//  RecipeEditorForm.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/1.
//

import SwiftUI

struct RecipeEditorForm: View {
    @Binding var config: RecipeEditorConfig
    
    var body: some View {
        Form {
            TextField("Recipe name", text: $config.recipe.title)
            Section {
                TextField("4-6", text: $config.recipe.servings, onCommit:  {
                    Text("Servings")
                })
                TextField("in seconds", text: $config.recipe.prepTimeAsText) {_ in
                    Text("Prep time")
                }
                TextField("in seconds", text: $config.recipe.cookTimeAsText) {_ in
                    Text("Cook time")
                }
                TextField("Breakfast, Lunch, Dinner", text: $config.recipe.collectionsAsText) {_ in
                    Text("Collections")
                }
            }
            
            Section {
                TextEditor(text: $config.recipe.ingredients)
                    .modifier(MacSpecificModifiers())
            }
            
            Section {
                TextEditor(text: $config.recipe.directions)
                    .modifier(MacSpecificModifiers())
            }
        }
    }
}

private struct MacSpecificModifiers: ViewModifier {
    func body(content: Content) -> some View {
        
        #if os(macOS)
        content
            .frame(height: 80)
            .border(.gray)
        #endif
    }
}
