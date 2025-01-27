//
//  PreviewContainer.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import Foundation
import SwiftData

struct PreviewContainer {
    let container: ModelContainer
    
    init() {
        do {
            // Dont persist sample data, only sore in memory.
            let modelCofig = ModelConfiguration(isStoredInMemoryOnly: true)
            container = try ModelContainer(for: Note.self, configurations: modelCofig)
        } catch {
            fatalError("Could not preview the container")
        }
    }
    
    // accessing container mainContext requires for it to be performed on the main thread.
    @MainActor
    func addNotes(notes: [Note]) {
        for note in notes {
            container.mainContext.insert(note)
        }
    }
    
    @MainActor
    func addSingularNote(note: Note) {
            container.mainContext.insert(note)
        
    }
}


