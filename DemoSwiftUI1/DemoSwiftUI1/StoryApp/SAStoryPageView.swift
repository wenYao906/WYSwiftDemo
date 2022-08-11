//
//  SAStoryPageView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct SAStoryPageView: View {
    
    let story: Story
    let pageIndex: Int
    
    var body: some View {
        VStack {
            ScrollView {
                Text(story[pageIndex].text)
            }
            
            ForEach(story[pageIndex].choices, id: \Choice.text) { aChoice in
                NavigationLink(aChoice.text, destination: SAStoryPageView(story: story, pageIndex: aChoice.destination))
//                {
//                    Text(aChoice.text)
//                        .multilineTextAlignment(.leading)
//                        .frame(maxWidth:.infinity, alignment: .leading)
//                        .padding()
//                        .background(Color.gray.opacity(0.25))
//                        .cornerRadius(8)
//                }
                

            }.padding()
            .navigationTitle("Page \(pageIndex + 1)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SAStoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        SAStoryPageView(story: story, pageIndex: 0)
    }
}
