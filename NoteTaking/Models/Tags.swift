//
//  Tags.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import Foundation
import SwiftUI


enum Tags: String, CaseIterable {
    case journal = "Journal"
    case work = "Work"
    case ideas = "Ideas"
    case shopping = "Shopping"
    case health = "Health"
    case travel = "Travel"
    case game = "Game"
    case other = "Other"
    
    var tagColor: Color {
        switch self {
        case .journal:
            return .blue
        case .work:
            return .green
        case .ideas:
            return .yellow
        case .shopping:
            return .orange
        case .health:
            return .red
        case .travel:
            return .purple
        case .game:
            return .pink
        case .other:
            return Color(.systemMint)
            
        }
    }
}
