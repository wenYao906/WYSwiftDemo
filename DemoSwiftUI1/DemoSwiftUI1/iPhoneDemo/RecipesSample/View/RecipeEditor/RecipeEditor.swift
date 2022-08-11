//
//  RecipeEditor.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/1.
//

import SwiftUI

struct RecipeEditor: View {
    
    @Binding var config: RecipeEditorConfig
    
    private var editorTitle: String {
        config.recipe.isNew ? "Add Recipe" : "Edit Recipe"
    }
    
    private var cancelButtonPlacement: ToolbarItemPlacement {
        #if os(macOS)
        ToolbarItemPlacement.cancellationAction
        #else
        .navigationBarLeading
        #endif
    }
    
    private var saveButtonPlacement: ToolbarItemPlacement {
        #if os(macOS)
        ToolbarItemPlacement.confirmationAction
        #else
        .navigationBarTrailing
        #endif
    }
    
    var body: some View {
        
        NavigationView {
            List {
                RecipeEditorForm(config: $config)
                    .toolbar {
                        ToolbarItem(placement: ToolbarItemPlacement.principal) {
                            Text(editorTitle)
                        }
                        
                        ToolbarItem(placement: cancelButtonPlacement) {
                            Button("Cancel") {
                                config.cancel()
                            }
                        }
                        
                        ToolbarItem(placement: saveButtonPlacement) {
                            Button("Save") {
                                config.done()
                            }
                        }
                    }
            }.padding()
        }
    }
}

