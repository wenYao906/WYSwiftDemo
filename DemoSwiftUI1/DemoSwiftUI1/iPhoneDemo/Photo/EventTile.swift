//
//  EventTile.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/1.
//

import SwiftUI

struct Event {
    let title: String
    let date: Date
    let location: String
    let symbol: String
}

struct EventTile: View {
    
    let event: Event
    let stripeHeight:CGFloat = 15.0
    
    var body: some View {
        HStack(alignment: VerticalAlignment.firstTextBaseline, spacing: 0) {
            Image(systemName: event.symbol)
                .font(.title)
            VStack(alignment: HorizontalAlignment.leading, spacing: 1.0) {
                Text(event.title)
                    .font(.title)
                Text(event.date, style: .date)
                Text(event.location)
                
            }
        }
        .padding()
        .padding(.top, stripeHeight)
        .background(
            ZStack(alignment: .top, content: {
            Rectangle().opacity(0.3)
            Rectangle().frame(maxHeight:stripeHeight)
        })
            .foregroundColor(Color.green)
        )
        
        .clipShape(RoundedRectangle(cornerRadius: stripeHeight, style: .continuous))
        

//
    }
}

struct EventTile_Previews: PreviewProvider {
    
    static let event = Event(title: "Buy Daisies", date: Date.init(), location: "Flower Shop", symbol: "gift")
    
       
    
    static var previews: some View {
        
        EventTile(event: event)
    }
}
