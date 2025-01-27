//
//  NoteTakingApp.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import SwiftUI
import SwiftData

@main
struct NoteTakingApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Note.self)
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
    
}
