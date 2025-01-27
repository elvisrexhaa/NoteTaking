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
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
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
            
            Spacer()
            
            Text(note.noteAdded.formatDate("HH:MM aa"))
                .font(.caption)
            
            
        }
        .padding(15)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
        .padding(.horizontal)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NoteCell(note: Note.sampleNotes[2])
}



