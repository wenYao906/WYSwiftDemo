//
//  DPEventEditor.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/5.
//

import Foundation
import SwiftUI

struct DPEventEditor: View {
    @Binding var event: DPEvent
    var isNew = false
    
    @State private var isDeleted = false
    @EnvironmentObject var eventData: DPEventData
//    @Environment(\.dismiss) private var dismiss
    
    // Keep a local copy in case we make edits, so we don't disrupt the list of events.
    // This is important for when the date changes and puts the event in a different section.
    @State private var eventCopy = DPEvent()
    @State private var isEditing = false
    
    private var isEventDeleted: Bool {
        !eventData.exists(event) && !isNew
    }
    
    var overLayView: some View {

        ZStack {
              Color(UIColor.systemBackground)
              Text("Event Deleted. Select an Event.")
                  .foregroundColor(.secondary)
    //                .foregroundStyle(.secondary)
          }
    }
    
    var body: some View {
        
//        VStack(alignment: HorizontalAlignment.center, spacing: 0.0) {
//            DPEventDetail(event: $eventCopy, isEditing: isNew ? true : isEditing)
//                .toolbar {
//                    ToolbarItem(placement: .cancellationAction) {
//                        if isNew {
//                            Button("Cancel") {
//                                print("点击了取消按钮")
////                                dismiss()
//                            }
//                        }
//                    }
//                    ToolbarItem {
//                        Button {
//                            if isNew {
//                                eventData.events.append(eventCopy)
////                                dismiss()
//                                print("点击了取消按钮")
//                            } else {
//                                if isEditing && !isDeleted {
//                                    print("Done, saving any changes to \(event.title).")
//                                    withAnimation {
//                                        event = eventCopy // Put edits (if any) back in the store.
//                                    }
//                                }
//                                isEditing.toggle()
//                            }
//                        } label: {
//                            Text(isNew ? "Add" : (isEditing ? "Done" : "Edit"))
//                        }
//                    }
//                }
//                .onAppear {
//                    eventCopy = event // Grab a copy in case we decide to make edits.
//                }
//                .disabled(isEventDeleted)
//
//            if isEditing && !isNew {
//
////                Button(role: .destructive, action: {
////                    isDeleted = true
////                    dismiss()
////                    eventData.delete(event)
////                }, label: {
////                    Label("Delete Event", systemImage: "trash.circle.fill")
////                        .font(.title2)
////                        .foregroundColor(.red)
////                })
////                    .padding()
//                Button {
//                   isDeleted = true
////                   dismiss()
//                    print("点击了取消按钮")
//                   eventData.delete(event)
//                } label: {
//                    Label("Delete Event", systemImage: "trash.circle.fill")
//                        .font(.title2)
//                        .foregroundColor(.red)
//                }.padding()
//
//            }
//        }.overlay({
//            if isEventDeleted {
//                Color(UIColor.systemBackground)
//                Text("Event Deleted. Select an Event.")
//                    .foregroundStyle(.secondary)
//            }
//        })
        
        
        
        VStack(alignment: .center, spacing: 0.0) {
            Text("起点")
        }.overlay( overLayView , alignment: .center)
        
        
        
    }
}

struct DPEventEditor_Previews: PreviewProvider {
    static var previews: some View {
        DPEventEditor(event: .constant(DPEvent()))
    }
}
