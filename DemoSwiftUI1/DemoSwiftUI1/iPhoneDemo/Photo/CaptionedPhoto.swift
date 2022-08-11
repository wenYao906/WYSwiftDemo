//
//  CaptionedPhoto.swift
//  DemoSwiftUI1
//
//  Created by study on 2022/7/29.
//

import SwiftUI

struct CaptionedPhoto: View {
    
    let assetName: String
    let captionText: String
    
    var body: some View {
        Image(assetName)
            .resizable()
            .scaledToFit()
            .overlay(Caption(text: captionText), alignment: .bottom)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding()
        
    }
}

struct Caption: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .background(Color.gray.opacity(0.75))
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .padding()
    }
}

struct CaptionedPhoto_Previews: PreviewProvider {
//    static var previews: some View {
//        CaptionedPhoto()
//    }
    
    static let landscapeName = "turtlerock"
    static let landscapeCaption = "This photo is wider than it is tall."
    static let portraitName = "Portrait"
    static let portraitCaption = "This photo is taller than it is wide."
    static var previews: some View {
        CaptionedPhoto(assetName: portraitName,
                       captionText: portraitCaption)
        CaptionedPhoto(assetName: landscapeName,
                       captionText: landscapeCaption)
        .preferredColorScheme(.dark)
        CaptionedPhoto(assetName: landscapeName,
                       captionText: landscapeCaption)
        .preferredColorScheme(.light)
    }
}




/**
 
 scaledToFit()
 缩放此视图以适合其父视图，同时在视图缩放时保持视图的纵横比。
 
 scaledToFill()
 占满整个屏幕
 缩放此视图以填充其父视图的视图，保持此视图的纵横比
 
 */
