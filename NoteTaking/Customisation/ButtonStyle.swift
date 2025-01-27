//
//  ButtonStyles.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import Foundation
import SwiftUI

struct BouncyButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.5 : 1)
            .scaleEffect(configuration.isPressed ? 0.76 : 1)
            .animation(.bouncy, value: configuration.isPressed)
    }
}

#Preview {
    Button(action: { print("Pressed") }) {
        Label("Press Me", systemImage: "star")
    }
    .buttonStyle(BouncyButtonStyle())
}




