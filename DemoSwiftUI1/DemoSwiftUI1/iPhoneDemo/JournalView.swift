//
//  JournalView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/29.
//

import SwiftUI

struct JournalView: View {
    
    static let aEvent = Event(title: "Buy Daisies", date: Date.init(), location: "Flower Shop", symbol: "gift")

    
    var body: some View {
        
        VStack {
            EventTile(event: JournalView.aEvent)
//            TrainCars()
//            Spacer()
//            CaptionedPhoto(assetName: "turtlerock", captionText: "This photo is wider than it is tall.")
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
