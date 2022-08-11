//
//  DPEventRow.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/8/5.
//

import Foundation
import SwiftUI

struct DPEventRow: View {
    let event: DPEvent
    
    var body: some View {
        HStack {
            Image(systemName: event.symbol)
                .sfSymbolStyling()
                .foregroundColor(event.color)
//                .foregroundStyle(event.color)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .fontWeight(.bold)

//                Text(event.date.formatted(date: .abbreviated, time: .shortened))
                Text("\(event.date)")
                    .font(.caption2)
                    .foregroundColor(.secondary)
//                    .foregroundStyle(.secondary)

            }
            
            if event.isComplete {
                Spacer()
                Image(systemName: "checkmark")
                    .foregroundColor(.secondary)
//                    .foregroundStyle(.secondary)
            }
            
            // Badge View
            ZStack {
              Circle()
                .foregroundColor(.red)

              Text("\(event.remainingTaskCount)")
                .foregroundColor(.white)
                .font(Font.system(size: 12))
            }
            .frame(width: 20, height: 20)
//            .offset(x: ( ( 2 * self.badgePosition) - 1 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ), y: -30)
//            .opacity(self.badgeNumber == 0 ? 0 : 1)
        }
        // 给 当前 View 添加提示文字（如通知小红点）
//        .badge(event.remainingTaskCount)
    }
}

struct DPEventRow_Previews: PreviewProvider {
    static var previews: some View {
        DPEventRow(event: DPEvent.example)
    }
}
