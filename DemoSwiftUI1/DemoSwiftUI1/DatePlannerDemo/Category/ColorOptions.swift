//
//  ColorOptions.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import Foundation
import SwiftUI

struct ColorOptions {
    static var all: [Color] = [
        .primary,
        .gray,
        .red,
        .orange,
        .yellow,
        .green,
//        .mint,
//        .cyan,
//        .indigo,
        .purple,
    ]
    
    static var `default` : Color = Color.primary
    
    static func random() -> Color {
        if let element = ColorOptions.all.randomElement() {
            return element
        } else {
            return .primary
        }
        
    }
}

/*
 
 public static let clear: Color

 public static let black: Color

 public static let white: Color




 public static let blue: Color



 public static let pink: Color



 public static let secondary: Color

 */
