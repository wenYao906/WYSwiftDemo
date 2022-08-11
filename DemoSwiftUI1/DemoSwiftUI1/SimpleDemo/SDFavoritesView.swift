//
//  SDFavoritesView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct SDFavoritesView: View {
    var body: some View {
        VStack {
            Text("Favorites")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            
            Text("Hobbies")
                .font(.title2)
            
            HStack {
                ForEach(information.hobbies, id: \.self) { aHobby in
                    Image(systemName: aHobby)
                        .resizable()
                        .frame(maxWidth: 80, maxHeight: 60)
                }.padding()
            }
            .padding()
            
            Text("Foods")
                .font(.title2)
            
            HStack(spacing: 60) {
                ForEach(information.foods, id: \.self) { food in
                    Text(food)
                        .font(.system(size: 48))

                }
            }.padding()

////            HStack(spacing: 60) {
//                ScrollView(Axis.Set.horizontal, showsIndicators: true, content: {
////                    ForEach(information.foods, id: \.self) { food in
////                        Text(food)
////                            .font(.system(size: 48))
////
////                    }
//                    Text("food")
//                        .font(.system(size: 48))
//                    Text("food2")
//                        .font(.system(size: 48))
//                    Text("food3")
//                        .font(.system(size: 48))
//                    Text("food4")
//                        .font(.system(size: 48))
//                    Text("food5")
//                        .font(.system(size: 48))
//                })
            
            ScrollView(Axis.Set.horizontal, showsIndicators: true, content: {
//                HStack(spacing: 20) {
                    ForEach(information.foodsScroll, id: \.self) { food in
                        Text(food)
                            .font(.system(size: 48))

                    }
//                }
            })
            
            Text("Favorite Colors")
                .font(.title2)
            
            HStack(spacing: 30) {
                ForEach(information.colors, id: \.self) { color in
                    color
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                }
            }.padding()
        }
    }
}

struct SDFavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        SDFavoritesView()
    }
}
