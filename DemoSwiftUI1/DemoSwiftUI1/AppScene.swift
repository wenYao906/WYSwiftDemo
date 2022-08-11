//
//  AppScene.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/4.
//

import Foundation
import SwiftUI

struct AppScene: Scene {
    
    let dataList = appList
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    ForEach(dataList.links) { aLink in
                       let aLinkView = aLink.linkView
    
                        NavigationLink(destination: aLinkView) {
                            Text(aLink.linkName)
                        }
                    }.navigationBarTitle(Text("View Layout And Pressentation"))
                }
            }
        }
    }
}

struct AppLink: Identifiable {
    var id = UUID()
    let linkName: String
    let linkSubDetail: String
    // 使用 AnyView 类型的擦除包装器
    let linkView: AnyView
}

struct NLinks {
    var links: [AppLink]
}




var appList = NLinks(links: [
    //下面创建对象是需要显式使用AnyView
    AppLink(linkName: "一个小的UI界面", linkSubDetail:"小名片", linkView: AnyView(MyScene())),
    AppLink(linkName: "标题+图片+文字", linkSubDetail:"小UI", linkView: AnyView(SimpleScene())),
    AppLink(linkName: "导航栏+跳转", linkSubDetail:"学习NavigationLink和NavigationView", linkView: AnyView(NavDemo())),
    AppLink(linkName: "苹果SwiftUI教程1 - 超市app", linkSubDetail:"苹果教程", linkView: AnyView(StoryAppScene())),
    AppLink(linkName: "学习State和Binding绑定", linkSubDetail:"外界教程", linkView: AnyView(eachOtherScene())),
    AppLink(linkName: "Date Planner",
            linkSubDetail:" Present hierarchical information in a list. Welcome to the Date Planner app. Use this app to organize and plan a series of events, organized by date. This walkthrough teaches you how to use lists and an observable data model to create dynamic lists of events and tasks. Time to jump in.",
            linkView: AnyView(DatePlannerScene())),
    
])


/**
 let myViewsName = ["MyScene","SimpleScene","NavDemo","StoryAppScene","eachOtherScene"]
 
 func containedView(viewName: String) -> AnyView {
     switch viewName {
     case "MyScene":
         return AnyView(MyScene())
     case "SimpleScene":
         return AnyView(SimpleScene())
     case "NavDemo":
         return AnyView(NavDemo())
     case "StoryAppScene":
         return AnyView(StoryAppScene())
     case "eachOtherScene":
         return AnyView(eachOtherScene())
     default:
         return AnyView(Text("None"))
     }
 }
 */
