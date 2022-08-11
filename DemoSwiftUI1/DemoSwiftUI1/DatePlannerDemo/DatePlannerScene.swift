//
//  DatePlannerScene.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct DatePlannerScene: View {
    /*
     应用程序使用变量eventData存储其数据。它是用@StateObject属性包装器定义的，用于创建可观察对象EventData的实例。因为这个对象是可观察的，SwiftUI会监视它以跟踪其值的任何变化。每当数据发生更改时，SwiftUI会自动更新使用（或观察）它的所有视图。
     */
    
    @StateObject private var eventData = DPEventData()
    
    var body: some View {
        NavigationView {
            DPEventList()
            Text("Select an Event")
                .foregroundColor(.secondary)
        }
        .environmentObject(eventData)
    }
}

/*
 要使eventData对整个视图层次结构可用，请使用.environmentObject修饰符并传入eventData实例。现在，您可以在导航视图的所有子视图（以及它们的子视图）中使用这些数据。
 
 */
