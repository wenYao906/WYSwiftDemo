//
//  RecipeEditorConfig.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/1.
//

import Foundation


// 这里所存储的数据，是 RecipeEditor 视图所需要的状态数据。
struct RecipeEditorConfig {
    var recipe = Recipe.emptyRecipe()
    var shouldSaveChanges = false
    var isPresented = false
    
    
    /// mutating: 为了能够让 RecipeEditor 视图中的状态改变，使用了 mutating 函数，用来更新数据来返回新的状态
    /// 更改视图的状态，以指示其正在编辑新配方。
    mutating func presentAddRecipe(sidebarItem: SidebarItem) {
        
        // 此方法创建一个空配方作为要编辑的配方。
        // 静态方法emptyRecipe（）创建一个新的配方实例，将其属性设置为新配方的默认值。
        recipe = Recipe.emptyRecipe()
        
        switch sidebarItem {
        case .favorites:
            recipe.isFavorite = true
        case .collection(let name):
            recipe.collections = [name]
        default:
            break
            
        }
        
        shouldSaveChanges = false
        isPresented = true
    }
    
    /// 编辑现有配方
    mutating func presentEditRecipe(_ recipeToEdit: Recipe){
        // 接收要编辑的配方作为参数，并将配方设置为传入配方
        recipe = recipeToEdit
        shouldSaveChanges = false
        isPresented = true
    }
    
    /// 表示编辑器应该保存对配方所做的更改，并关闭RecipeEditor视图
    /// 该方法将shouldSaveChanges设置为true，以指示应用程序应保存对配方所做的更改。
    /// 它还将isPresented设置为false，这会告诉SwiftUI关闭编辑器视图。
    mutating func done() {
        shouldSaveChanges = true
        isPresented = false
    }
    
    /// 但它将shouldSaveChanges设置为false，告诉应用程序忽略对配方所做的更改。
    /// 该方法还将isPresented设置为false，这会告诉SwiftUI关闭编辑器视图。
    mutating func cancel() {
        shouldSaveChanges = false
        isPresented = false
    }
}
