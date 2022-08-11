//
//  DPEvent.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import Foundation
import SwiftUI

struct DPEvent: Identifiable, Hashable {
    var id = UUID()
    var symbol: String = DPEventSymbols.randomName()
    var color: Color = ColorOptions.random()
    var title = ""
    var tasks = [DPEventTask(text: "")]
    var date = Date()

    
    // MARK:- 计算属性
    /// 帮助人们根据要完成的任务的日期和数量来组织列表的各个部分
    var remainingTaskCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var isComplete: Bool {
        tasks.allSatisfy { $0.isCompleted }
    }
    
    var isPast: Bool {
        date < Date.init()
    }
    
    var isWithinSevenDays: Bool {
        !isPast && date < Date.init().sevenDaysOut
    }
    
    var isWithinSevenToThirtyDays: Bool {
        !isPast && !isWithinSevenDays && date < Date.init().thirtyDaysOut
    }
    
    var isDistant: Bool {
        date >= Date().thirtyDaysOut
    }

    static var example = DPEvent(
        symbol: "case.fill",
        title: "Sayulita Trip",
        tasks: [
            DPEventTask(text: "Buy plane tickets"),
            DPEventTask(text: "Get a new bathing suit"),
            DPEventTask(text: "Find an airbnb"),
        ],
        date: Date(timeIntervalSinceNow: 60 * 60 * 24 * 365 * 1.5)
    )
    
    
}

// Convenience methods for dates.
extension Date {
    var sevenDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 7, to: self) ?? self
    }
    
    var thirtyDaysOut: Date {
        Calendar.autoupdatingCurrent.date(byAdding: .day, value: 30, to: self) ?? self
    }
}
