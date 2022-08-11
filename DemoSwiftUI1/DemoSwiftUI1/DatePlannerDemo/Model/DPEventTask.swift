//
//  DPEventTask.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import Foundation

struct DPEventTask: Identifiable, Hashable {
    var id = UUID()
    var text: String
    var isCompleted = false
    var isNew = false
}
