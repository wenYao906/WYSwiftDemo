//
//  Circle.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/6.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
//        Image("turtlerock")
//            .clipShape(Circle())
        VStack {
            Image("turtlerock")
                .clipShape(Circle())
            Text("123")
        }
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        Circle()
    }
}

/**
 clipShape(Circle())
 */
