//
//  DemoSwiftUI1App.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/6.
//

import SwiftUI

@main
struct DemoSwiftUI1App: App {
    var body: some Scene {
        #if os(iOS)

        AppScene()
        #elseif os(macOS)
        MyAlternativeScene()
        #endif
    }
}

/**
 这是应用程序的入口点 => @main
 在 Xcode 13 及 以上的版本中，类名是 LandmarksApp
 swiftUI 的应用程序生命周期，应该继承至 App .
 body 属性会返回一个或多个场景。这些场景会提供显示内容。
 
 @main : 一个 SwiftUI 应用程序有且只有一个入口点，如果一个应用 有多个@main， 会导致编译器报错。
 
 var body: some Scene
1.  此body属性 是 Scene 类型的。
 2. Scene: 它是应用程序用户界面的一部分，它的生命周期由系统来管理。
 3. SwiftUI 提供了很多类型的场景，例如：WindowGroup、Window、DocumentGroup 和 Settings.
 
 WindowGroup
 1. 本示例使用 WindowGroup 来展示应用程序的主窗口。
 2. SwiftUI为WindowGroup提供了特定于平台的行为。
 例如，在macOS和iPadOS中，一个人可以从组中打开多个窗口。
 在macOS中，一个人可以将窗口组的多个实例合并到一组选项卡中。
 3. 如果您正在创建基于文档的应用程序，如文字处理器或文本编辑器，则可以使用DocumentGroup场景打开、保存和编辑文档。
 有关更多信息，请参阅使用SwiftUI构建基于文档的应用程序。
 
 
 ContentView()
 1. 这是一个自定义视图，用于创建由图像和文本组成的视图层次。
 
 
 
 在SwiftUI中，场景包含应用程序显示为其用户界面的视图层次。
 视图层次定义了相对于其他视图的视图布局。
 在此示例中，WindowGroup场景包含ContentView使用其他视图组成的视图层次。
 
 View hierarchy
 WindowGroup
       |
  ContentView
       |
     VStack
       |
       |
   |                 |
 Image            Text
 
 */
