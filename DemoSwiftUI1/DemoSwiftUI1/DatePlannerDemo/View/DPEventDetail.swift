//
//  DPEventDetail.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/5.
//

import Foundation
import SwiftUI

struct DPEventDetail: View {
    @Binding var event: DPEvent
    let isEditing: Bool
    
    @State private var isPickingSymbol = false
    
    var body: some View {
        List {

            HStack {
                Button {
                    isPickingSymbol.toggle()
                } label: {
                    Image(systemName: event.symbol)
                        .sfSymbolStyling()
                        .foregroundColor(event.color)
                        .opacity(isEditing ? 0.3 : 1)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 5)

                if isEditing {
                    TextField("New Event", text: $event.title)
                        .font(.title2)
                } else {
                    Text(event.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
            }
            
            if isEditing {
                DatePicker("Date", selection: $event.date)
                    .labelsHidden()
//                    .listRowSeparator(.hidden) // 隐藏两端视图的列表分割线

            } else {
                HStack {
                    Text(event.date, style: .date)
                    Text(event.date, style: .time)
                }
//                .listRowSeparator(.hidden)
            }
            
            Text("Tasks")
                .fontWeight(.bold)
            
//            ForEach($event.tasks) { $item in
//                DPTaskRow(task: $item, isEditing: isEditing)
//            }
//            .onDelete(perform: { indexSet in
//                event.tasks.remove(atOffsets: indexSet)
//            })
            
         
            
            
            Button {
                event.tasks.append(DPEventTask(text: "", isNew: true))
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Task")
                }
            }
            .buttonStyle(BorderlessButtonStyle())
        }
//        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
//        #endif
        .sheet(isPresented: $isPickingSymbol) {
            DPSymbolPicker(event: $event)
        }
    }
}

struct DPEventDetail_Previews: PreviewProvider {
    static var previews: some View {
        DPEventDetail(event: .constant(DPEvent.example), isEditing: true)
    }
}
