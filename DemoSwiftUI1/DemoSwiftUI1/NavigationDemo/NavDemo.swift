//
//  NavDemo.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct NavDemo: View {
    var body: some View {
        NavDemoContentView()
    }
}


/**
 视图环境 @Environment，
 Environment提供了视图共享的属性绑定服务，通过这些属性可以完成视图的基本操作，
 其中一个属性叫presentationMode，该属性绑定了导航页面间的上下文关系，通过它的dismiss方法我们可以手动返回页面。
 
 注：该方法在iOS 15.0后即将被属性dismiss替代，但是考虑到撰写本文时主流系统是iOS 14.5，出于兼容需要，我们依然使用presentationMode来完成代码。
 
 @Environment 是什么东西呢？如果不阅读文档是无法了解它的全貌的，但是这并不妨碍我们理解它基本的概念。@Environment是SwiftUI在创建View时生成的一个全局的属性装饰器，它包含了很多共享的系统范围的配置。暂时你可以把它理解为类似“环境变量”一样的存在。而presentationMode就是该环境变量下的一个属性。
 */


// 通过编程实现页面返回逻辑
struct NDDestinationView: View {
    // 声明属性presentationMode
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Text("Destination View")
            //            .navigationBarHidden(true) // 追加后destination不再出现标题栏
            .navigationBarHidden(false) // 标题栏不隐藏
            .navigationTitle("Title 2") // 追加标题
            
            .onTapGesture {
                // 点击"Destination View"后返回
                self.presentationMode.wrappedValue.dismiss()
            }
    }
}

struct NavDemoContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: NDDestinationView(),
                label: {
                    Text("Navigate View")
                }).navigationBarTitle("Title", displayMode: .inline)
                // 设置按钮样式
                .buttonStyle(DefaultButtonStyle())
                .onAppear() {
                    // 设置标题颜色
                    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.red]
                }
            
        }
    }
}


// 定义一个ButtonStyle，命名为DefaultButtonStyle
// 去掉点击的交互特效
struct DefaultButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.clear : Color.clear)
    }
}



/*  基础跳转
 
 struct NavDemo: Scene {
 var body: some Scene {
 WindowGroup {
 NavigationView {
 // Text("Destination") 第二个页面（即跳转后的页面）显示的文本内容
 NavigationLink(
 destination: Text("Destination")
 // 隐藏二级界面的标题栏
 .navigationBarHidden(true))
 {
 // 第一个页面的跳转按钮内容
 Text("Navigate")
 }
 .navigationBarTitle("Main", displayMode: .large) // 第一个页面的 导航栏标题 和第二个页面的返回按钮文字
 }
 }
 }
 }
 
 */


/*
 本篇文章:
 https://blog.csdn.net/olsQ93038o99S/article/details/121600602
 */
