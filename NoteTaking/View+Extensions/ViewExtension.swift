//
//  ViewExtension.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import Foundation
import SwiftUI

extension View {
    func disableWithOpacity(status: Bool) -> some View {
        self
            .disabled(status)
            .opacity(status ? 0.7 : 1)
    }
 
}
