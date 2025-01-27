//
//  SampleNotes.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import Foundation


extension Note {
    static let sampleNotes: [Note] = [
        Note(noteTitle: "Note 1", noteContent: "Content for note 1", tags: [
            .health, .journal, .travel
        ], noteAdded: .now),
        Note(noteTitle: "Note 2", noteContent: "Content for note 2", tags: [
            .work, .journal
        ], noteAdded: .now),
        Note(noteTitle: "Note 3", noteContent: "Content for note 3", tags: [
            .travel, .journal
        ], noteAdded: .now),
        Note(noteTitle: "Note 4", noteContent: "Content for note 4", tags: [
            .health, .journal
        ], noteAdded: .now),
    ]
}
