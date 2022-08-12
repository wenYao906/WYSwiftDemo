//
//  MemoryGameModel.swift
//  SiTanFuSwiftUIApp
//
//  Created by study on 2022/8/12.
//

import Foundation

struct MemoryGameModel<CardContent> {
    var cards:Array<Card>
    
    func choose( _ card: Card ) {
        // 选择卡片
    }
    
    struct Card {
        /// 卡片是否正面朝上
        var isFaceUp: Bool
        /// 卡片是否已经匹配
        var isMatched: Bool
        /// 卡片的内容
        var content: CardContent
    }
}
