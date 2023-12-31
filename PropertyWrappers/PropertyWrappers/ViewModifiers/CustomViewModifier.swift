//
//  CustomViewModifier.swift
//  PropertyWrappers
//
//  Created by kanagasabapathy on 28/12/23.
//

import Foundation
import SwiftUI

struct CustomEnvChildView: ViewModifier {
    var foregroundColor: Color = .blue
    var backgroundColor: Color = .yellow
    func body(content: Content) -> some View {
        content
            .foregroundStyle(foregroundColor)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

extension View {
    func highlighterView(foregroundColor: Color = .blue, backgroundColor: Color = .yellow) -> some View {
       modifier(CustomEnvChildView(foregroundColor: foregroundColor, backgroundColor: backgroundColor))
    }
}

extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .frame(width: 100, height: 100)
            .aspectRatio(0.5, contentMode: .fit)
            .clipShape(Rectangle())
    }
}
