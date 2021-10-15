//
//  Examples.swift
//  
//
//  Created by Jonathan Holland on 10/15/21.
//

import SwiftUI

let imageNames: [String] = [
    "plus",
    "minus",
    "person",
    "person.2",
    "map",
    "trash",
    "doc",
    "paperplane",
    "network",
    "pencil",
    "pencil.slash",
    "scribble.variable",
    "rectangle.portrait.and.arrow.right",
    "folder",
    "lasso.and.sparkles",
    "xmark.bin",
    "list.bullet.rectangle.fill",
    "paperclip",
    "calendar.day.timeline.left",
    "arrowshape.turn.up.forward.fill",
    "book.fill",
    "bookmark",
    "personalhotspot"
]

public struct ExampleView: View {
    
    public var body: some View {
        WrapStack(imageNames) { imageName in
            HStack {
                Image(systemName: imageName)
                Text(imageName)
            }
        }
    }
}

public struct ExampleView_Previews: PreviewProvider {
    
    public static var previews: some View {
        WrapStack(imageNames) { imageName in
            HStack {
                Image(systemName: imageName)
                Text(imageName)
            }
        }
    }
}
