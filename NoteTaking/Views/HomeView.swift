//
//  ContentView.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State private var showAddNoteView: Bool = false
    @State private var toBeUpdatedNote: Note?
    @Environment(\.modelContext) private var ctx
    @Query(sort: \Note.noteAdded) var notes: [Note]

    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [
            .font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        
        UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // list of notes
                if notes.isEmpty {
                    ContentUnavailableView("No notes available yet.", systemImage: "square.stack.3d.up.slash", description: Text("Press the button below to add a note"))
                        
                } else {
                    ForEach(notes) { note in
                        // TODO: note cell
                        NoteCell(note: note) {
                            toBeUpdatedNote = note
                        }
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "gearshape")
                            .foregroundStyle(.primary)
                    }
                    .buttonStyle(.plain)
                }
            }
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .safeAreaInset(edge: .bottom) {
                addNoteButton
            }
            .sheet(isPresented: $showAddNoteView) {
                NavigationStack {
                    AddNoteView()
                       
                }
            }
            .sheet(item: $toBeUpdatedNote) { note in
                UpdateNoteView(note: note)
            }
        }
    }
}

#Preview {
    let preview = PreviewContainer()
    preview.addNotes(notes: Note.sampleNotes)
    return HomeView()
        .modelContainer(preview.container)
}


extension HomeView {
    private var addNoteButton: some View {
        Button {
            // TODO: Toggle add note view
            showAddNoteView = true
        } label: {
            Image(systemName: "square.and.pencil.circle")
                .font(.system(size: 30))
                .foregroundStyle(.primary)
                .fontWeight(.regular)
        }
        .padding()
        .background {
            Circle()
                .fill(.ultraThinMaterial)
                .shadow(radius: 6)
        }
        .padding(.trailing, 30)
        .frame(maxWidth: .infinity, alignment: .trailing)
        .buttonStyle(.plain)
    }
}
