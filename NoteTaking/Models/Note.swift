//
//  Note.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import Foundation
import SwiftData

@Model
class Note {
    var noteTitle: String
    var noteContent: String
    var noteAdded: Date
    var tagValues: [String]
    
    init(noteTitle: String, noteContent: String, tags: [Tags], noteAdded: Date = .now) {
        self.noteTitle = noteTitle
        self.noteContent = noteContent
        self.tagValues = tags.map({ $0.rawValue })
        self.noteAdded = noteAdded
    }
    
    // Computed property to work with Tags enum
    var tags: [Tags] {
        get {
            tagValues.compactMap { Tags(rawValue: $0) }
        }
        set {
            tagValues = newValue.map { $0.rawValue }
        }
    }
}
