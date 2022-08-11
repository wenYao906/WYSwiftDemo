//
//  SFSymbolStyling.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/5.
//

import Foundation
import SwiftUI

struct SFSymbolStyling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .imageScale(.large)
            .font(.largeTitle)
//            .symbolRenderingMode(.monochrome) //符号渲染模式
    }
}

extension View {
    func sfSymbolStyling() -> some View {
        modifier(SFSymbolStyling())
    }
}
