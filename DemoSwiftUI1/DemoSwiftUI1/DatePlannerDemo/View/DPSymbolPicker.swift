//
//  DPSymbolPicker.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/5.
//

import Foundation
import SwiftUI



struct DPSymbolPicker: View {
    @Binding var event: DPEvent
    @State private var selectedColor: Color = ColorOptions.default
//    @Environment(\.dismiss) private var dismiss
//    @Environment(\.scenePhase) private var scenePhase
    @State private var symbolNames = DPEventSymbols.symbolNames
    @State private var searchInput = ""
    
    var columns = Array(repeating: GridItem(.flexible()), count: 6)

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
//                    dismiss()
                    print("点击了取消按钮")
                } label: {
                    Text("Done")
                }
                .padding()
            }
            HStack {
                Image(systemName: event.symbol)
                    .font(.title)
                    .imageScale(.large)
                    .foregroundColor(selectedColor)

            }
            .padding()

            HStack {
                ForEach(ColorOptions.all, id: \.self) { color in
                    Button {
                        selectedColor = color
                        event.color = color
                    } label: {
                        Circle()
                            .foregroundColor(color)
                    }
                }
            }
            .padding(.horizontal)
            .frame(height: 40)

            Divider()

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(symbolNames, id: \.self) { symbolItem in
                        Button {
                            event.symbol = symbolItem
                        } label: {
                            Image(systemName: symbolItem)
                                .sfSymbolStyling()
                                .foregroundColor(selectedColor)
                                .padding(5)
                        }
                        .buttonStyle(PlainButtonStyle())
//                        .buttonStyle(.plain)
                    }
                }
                .drawingGroup()
            }
        }
        .onAppear {
            selectedColor = event.color
        }
    }
}

struct DPSFSymbolBrowser_Previews: PreviewProvider {
    static var previews: some View {
        DPSymbolPicker(event: .constant(DPEvent.example))
    }
}
