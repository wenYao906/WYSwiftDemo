//
//  TrainCars.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/29.
//

import SwiftUI

struct TrainCars: View {
    @State private var longerTrain = false
    
    var body: some View {
        HStack {
//            Spacer()
            VStack(alignment: HorizontalAlignment.leading, spacing: 20) {
                Toggle(isOn: $longerTrain) {
                    Text("Long Train")
                }
                Text("Conditional:")
                HStack {
                    Image(systemName: "airplane")
                    if longerTrain {
                        Image(systemName: "car")
                    }
                    Image(systemName: "bus")
                }
                Divider()
                Text("Opacity:")
                HStack {
                    Image(systemName: "airplane")
                    Image(systemName: "car")
                        .opacity(longerTrain ? 1 : 0)
                    Image(systemName: "bus")
                }
                Text("Hidden:")
                HStack {
                    Image(systemName: "airplane")
                    Image(systemName: "car")
                        .hidden()
                    Image(systemName: "bus")
                }
                Divider()
            }
            .padding()
            Spacer()
            
        }
    }
    
}

struct TrainCars_Previews: PreviewProvider {
    static var previews: some View {
        TrainCars()
    }
}
