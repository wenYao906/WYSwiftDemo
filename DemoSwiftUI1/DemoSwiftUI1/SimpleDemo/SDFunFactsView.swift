//
//  SDFunFactsView.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/3.
//

import SwiftUI

struct SDFunFactsView: View {
    
    @State private var funFact = ""
    
    var body: some View {
        VStack {
            Text("Fun Facts")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(funFact)
                .padding()
                .font(.title)
                .frame(minHeight:400)
            
            Button("Show Random Fact") {
                funFact = information.funFacts.randomElement()!
            }
        }.padding()
    }
}

struct SDFunFactsView_Previews: PreviewProvider {
    static var previews: some View {
        SDFunFactsView()
    }
}
