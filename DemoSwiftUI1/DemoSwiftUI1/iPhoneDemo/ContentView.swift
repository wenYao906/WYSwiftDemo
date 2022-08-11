//
//  ContentView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/6.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/**
 
 ContentView 继承至 View ,代表它是一个符合View协议的一个结构Struct
 屏幕中出现的一个或多个视图是视图定义。一个视图通常由一个或多个视图组合而成，从而创建视图层次。
 
 VStack：
 1. 垂直排列子视图
 2. VStack同时渲染其包含的任何屏幕上或屏幕外视图。
 当您有少量子视图时，使用VStack是理想的。
 然而，如果你的应用程序需要显示更多的子视图，可以考虑使用LazyVStack，
 它只在应用程序需要在屏幕上显示视图时才渲染视图。
 
 padding(_:_:)
 1. 用于修饰VStack，在VStack视图的边缘添加特定的默认填充量。
 2. 还可以通过提供边和长度参数值来指定应用的边和填充量。如：padding([.bottom, .trailing], 20)
 
 
 
 一个 SwiftUI 视图文件 会有2个结构。
 1. 第一个结构 是编写视图的内容和布局的。
 2. 第二个结构是 声明这个视图的预览。
 
 画布：
 在右侧，有一个画布，这个画布会显示 UI 界面。
 如果没有显示这个画布，点击 编辑器 -> 画布 来显示它。
 当你修改当前页面的UI时，画布会自动更新。
 
 修改UI的方法：
 1. 可以使用代码进行修改UI
    * 可以使用修饰符，多个修饰符使用链式，垂直堆叠。
    * 修饰符：就是OC中的属性。如 .font(.title) .foregroundColor(.green)
 2. 可以单击代码中的UI, 选择“Show SwiftUI Inspector” 来修改UI
 3. 可以使用检查器来修改UI
    * 1. 在画布中，按住Command键，单击要修改的UI,选择“Show SwiftUI Inspector ”

 创建 SwiftUI 视图：
 1. 在 视图的 body 属性中写：
    * 内容
    * 布局
    * 行为
 2. body 属性只返回单个视图。
 所以多个视图的时候，需要将多个视图组合在一起，并嵌套到堆栈中。
 这些视图可以水平、垂直或背对前地将视图分组在一起。
 
 
 
 SwiftUI 的一些属性：
 1. VStack: 垂直控件
 2. HStack: 水平控件
 3. 如果想让UI的布局占设备的全部宽度，可以在水平控件HStack中添加一个Spacer(),来容纳两个文本视图。
 4. Space() 间隔展开，使其包含视图使用它的父视图所有控件，而不是仅仅由其内容来定义它的大小。
 5. padding() 修饰符，提供一些空白（空间）。
 */
