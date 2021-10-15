//
//  HeightPreference.swift
//  
//
//  Created by Jonathan Holland on 10/15/21.
//

import SwiftUI

public struct HeightPreference: PreferenceKey {
    public static var defaultValue: CGFloat = .zero
    
    public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

public struct HeightModifier: ViewModifier {
    
    @State private var height: CGFloat = .zero
    
    public func body(content: Content) -> some View {
        content
            .frame(height: height) // << variant for ScrollView/List
//            .frame(maxHeight: height) // << variant for VStack
            .onPreferenceChange(HeightPreference.self) { self.height = $0 }
    }
}
