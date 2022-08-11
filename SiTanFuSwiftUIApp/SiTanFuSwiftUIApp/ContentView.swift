//
//  ContentView.swift
//  SiTanFuSwiftUIApp
//
//  Created by study on 2022/8/5.
//

import SwiftUI

struct ContentView: View {
    
    let cardData = ["☀︎","☼","☽","☾",
                    "☂︎","☔︎","☃︎","★",
                    "☆","☇","☈","♠︎",
                    "♣︎","♥︎","♦︎","♤",
                    "♧","♡","♢","♚"]
    
    @State var emojiCount = 4
    
    var body: some View {
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(cardData[0..<emojiCount], id: \.self) { cardItem in
                        CardView(cardName: cardItem)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                removeCardView
                Spacer()
                addCardView
            }.font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    
    var removeCardView: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
            
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    
    var addCardView: some View {
        Button(action: {
            if emojiCount < cardData.count {
                emojiCount += 1
            }
        }, label: {
            
            Image(systemName: "plus.circle")
        })
    }
}






struct CardView: View {
    
    var cardName: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let aRounded = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                aRounded
                    .fill()
                    .foregroundColor(.white)
                aRounded
                    .strokeBorder(lineWidth: 3)
                Text(cardName)
                    .font(.largeTitle)
            }else {
                aRounded
                    .fill()
//                    .foregroundColor(.red)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
