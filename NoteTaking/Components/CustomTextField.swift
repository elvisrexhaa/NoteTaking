//
//  CustomTextField.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    let textBinding: Binding<String>
    
    var body: some View {
        TextField(placeholder, text: textBinding, axis: placeholder == "Note content" ? .vertical : .horizontal)
            .padding()
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
            .padding(.horizontal)
    }
}

//#Preview {
//    CustomTextField()
//}
