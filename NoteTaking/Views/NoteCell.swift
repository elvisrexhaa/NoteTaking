//
//  NoteCell.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import SwiftUI
import SwiftData

struct NoteCell: View {
    var note: Note
    let onNotePressed: () -> Void
    var body: some View {
        
        Button {
            withAnimation(.smooth(duration: 0.25)) {
                onNotePressed()
            }
            
        } label: {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(note.noteAdded.formatDate("dd MMM YYYY (HH:MM aa)"))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    
                    Text(note.noteTitle)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text(note.noteContent)
                        .font(.subheadline)
                    
                    HStack {
                        ForEach(note.tags, id: \.rawValue) { tag in
                            Text("#" + tag.rawValue)
                                .font(.caption)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 4)
                                .background(tag.tagColor.opacity(0.2), in: .rect(cornerRadius: 10))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(tag.tagColor, lineWidth: 0.5)
                                }
                        }
                    }
                    
                }
                
                Spacer(minLength: 0)
                
                Menu {
                    // Multiple buttons here
                    Button(role: .destructive) {
                        //
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }

                    Button {
                        // delete note here
                    } label: {
                        Label("Update", systemImage: "arrow.up.doc.on.clipboard")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .padding(.top, 6)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(15)
            .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
            .padding(.horizontal)
        }
        .buttonStyle(BouncyButtonStyle())
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NoteCell(note: Note.sampleNotes[0]) {
        //
    }
}



