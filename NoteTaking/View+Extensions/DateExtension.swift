//
//  DateExtension.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import Foundation
import SwiftUI

extension Date {
    func formatDate(_ dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: self)
    }
}
