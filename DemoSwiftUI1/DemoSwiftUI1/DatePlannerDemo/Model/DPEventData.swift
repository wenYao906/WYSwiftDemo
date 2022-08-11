//
//  DPEventData.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import Foundation
import SwiftUI

/// 用于存储和修改应用程序在其UI中显示的所有事件.
/// ObservableObject协议，这意味着如果其发布的任何值发生变化，
/// SwiftUI将通知所有观察者（使用这些值的视图），并自动更新这些视图
class DPEventData: ObservableObject {
    /// 在定义此属性时使用@Published属性包装器，可以指示SwiftUI通知所有观察者，
    /// 并在事件数组发生变化时更新其视图。这允许您从阵列中添加和删除事件，并立即在UI中看到更改。
    @Published var events: [DPEvent] = [
        DPEvent(symbol: "gift.fill",
              color: .red,
              title: "Maya's Birthday",
              tasks: [DPEventTask(text: "Guava kombucha"),
                      DPEventTask(text: "Paper cups and plates"),
                      DPEventTask(text: "Cheese plate"),
                      DPEventTask(text: "Party poppers"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),

        DPEvent(symbol: "theatermasks.fill",
              color: .yellow,
              title: "Pagliacci",
              tasks: [DPEventTask(text: "Buy new tux"),
                      DPEventTask(text: "Get tickets"),
                      DPEventTask(text: "Pick up Carmen at the airport and bring her to the show"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 22)),
        DPEvent(symbol: "facemask.fill",
              color: .purple,
              title: "Doctor's Appointment",
              tasks: [DPEventTask(text: "Bring medical ID"),
                      DPEventTask(text: "Record heart rate data"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 4)),
        DPEvent(symbol: "leaf.fill",
              color: .green,
              title: "Camping Trip",
              tasks: [DPEventTask(text: "Find a sleeping bag"),
                      DPEventTask(text: "Bug spray"),
                      DPEventTask(text: "Paper towels"),
                      DPEventTask(text: "Food for 4 meals"),
                      DPEventTask(text: "Straw hat"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 36)),
        DPEvent(symbol: "gamecontroller.fill",
              color: .red,
              title: "Game Night",
              tasks: [DPEventTask(text: "Find a board game to bring"),
                      DPEventTask(text: "Bring a desert to share"),
                     ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 2)),
        DPEvent(symbol: "graduationcap.fill",
              color: .primary,
              title: "First Day of School",
              tasks: [
                  DPEventTask(text: "Notebooks"),
                  DPEventTask(text: "Pencils"),
                  DPEventTask(text: "Binder"),
                  DPEventTask(text: "First day of school outfit"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365)),
        DPEvent(symbol: "book.fill",
              color: .purple,
              title: "Book Launch",
              tasks: [
                  DPEventTask(text: "Finish first draft"),
                  DPEventTask(text: "Send draft to editor"),
                  DPEventTask(text: "Final read-through"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 365 * 2)),
        DPEvent(symbol: "globe.americas.fill",
              color: .gray,
              title: "WWDC",
              tasks: [
                  DPEventTask(text: "Watch Keynote"),
                  DPEventTask(text: "Watch What's new in SwiftUI"),
                  DPEventTask(text: "Go to DT developer labs"),
                  DPEventTask(text: "Learn about Create ML"),
              ],
              date: Date.from(month: 6, day: 7, year: 2021)),
        DPEvent(symbol: "case.fill",
              color: .orange,
              title: "Sayulita Trip",
              tasks: [
                  DPEventTask(text: "Buy plane tickets"),
                  DPEventTask(text: "Get a new bathing suit"),
                  DPEventTask(text: "Find a hotel room"),
              ],
              date: Date.roundedHoursFromNow(60 * 60 * 24 * 19)),
    ]

    func delete(_ event: DPEvent) {
        events.removeAll { $0.id == event.id }
    }
    
    func add(_ event: DPEvent) {
        events.append(event)
    }
    
    func exists(_ event: DPEvent) -> Bool {
        events.contains(event)
    }
    
    /// 根据请求的时间段返回已排序事件的数组
    func sortedEvents(period: Period) -> Binding<[DPEvent]> {
        Binding<[DPEvent]>(
            get: {
                self.events
                    .filter {
                        switch period {
                        case .nextSevenDays:
                            return $0.isWithinSevenDays
                        case .nextThirtyDays:
                            return $0.isWithinSevenToThirtyDays
                        case .future:
                            return $0.isDistant
                        case .past:
                            return $0.isPast
                        }
                    }
                    .sorted { $0.date < $1.date }
            },
            set: { events in
                for event in events {
                    if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                        self.events[index] = event
                    }
                }
            }
        )
    }
}

// MARK:-
/// 时段枚举提供用于对列表排序的每个时间类别。这些类别包括下一个销售日、下一个第三十三日、未来和过去。
enum Period: String, CaseIterable, Identifiable {
    case nextSevenDays = "Next 7 Days"
    case nextThirtyDays = "Next 30 Days"
    case future = "Future"
    case past = "Past"
    
    var id: String { self.rawValue }
    var name: String { self.rawValue }
}

// MARK:- 
extension Date {
    static func from(month: Int, day: Int, year: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let calendar = Calendar(identifier: .gregorian)
        if let date = calendar.date(from: dateComponents) {
            return date
        } else {
            return Date()
        }
    }

    static func roundedHoursFromNow(_ hours: Double) -> Date {
        let exactDate = Date(timeIntervalSinceNow: hours)
        guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
            return exactDate
        }
        return hourRange.end
    }
}
