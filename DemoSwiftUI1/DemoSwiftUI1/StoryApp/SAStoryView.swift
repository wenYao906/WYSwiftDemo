//
//  SAStoryView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct SAStoryView: View {
    var body: some View {

        NavigationView {
            NavigationLink(destination: Text("StoryView")) {
                SAStoryPageView(story: story, pageIndex: 0)
            }
        }
    }
}

struct SAStoryView_Previews: PreviewProvider {
    static var previews: some View {
        SAStoryView()
    }
}
