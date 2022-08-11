//
//  SDStoryView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct SDStoryView: View {
    var body: some View {
        VStack {
            Text("My Story")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            ScrollView {
                Text(information.story)
                    .font(.body)
                    .padding()
            }
        }
        .padding([.top, .bottom], 50)
    }
}

struct SDStoryView_Previews: PreviewProvider {
    static var previews: some View {
        SDStoryView()
    }
}
