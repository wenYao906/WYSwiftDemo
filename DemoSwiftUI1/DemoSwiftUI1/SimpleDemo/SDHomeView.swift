//
//  SDHomeView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct SDHomeView: View {
    var body: some View {
        VStack {
            Text("All About")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Image(information.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
            
            Text(information.name)
                .font(.title)
        }
    }
}

struct SDHomeView_Previews: PreviewProvider {
    static var previews: some View {
        SDHomeView()
    }
}
