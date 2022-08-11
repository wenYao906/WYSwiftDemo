//
//  DPEventList.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/4.
//


import SwiftUI

struct DPEventList: View {
    @EnvironmentObject var eventData: DPEventData
    @State private var isAddingNewEvent = false
    @State private var newEvent = DPEvent()
    
    var body: some View {
        
        List {
            ForEach(Period.allCases) { period in
                if !eventData.sortedEvents(period: period).isEmpty {
                    Section(content: {
                        ForEach(eventData.sortedEvents(period: period)) { event in
                            NavigationLink {
                                DPEventEditor(event: event)
                            } label: {
                                DPEventRow(event: event)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    eventData.delete(event)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                        }
                    }, header: {
                        Text(period.name)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    })
                }
            }
        }
        .navigationTitle("Date Planner")
        .toolbar {
            ToolbarItem {
                Button {
                    newEvent = DPEvent()
                    isAddingNewEvent = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isAddingNewEvent) {
            NavigationView {
                DPEventEditor(event: $newEvent, isNew: true)
            }
        }
    }
}

struct DPEventList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DPEventList().environmentObject(DPEventData())

        }
    }
}
