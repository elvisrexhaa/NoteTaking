//
//  UpdateNoteView.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import SwiftUI
import SwiftData

struct UpdateNoteView: View {
    @Bindable var note: Note
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            CustomTextField(placeholder: "Note title", textBinding: $note.noteTitle)
            
            CustomTextField(placeholder: "Note content" ,textBinding: $note.noteContent)
                .lineLimit(8, reservesSpace: true)
            
            DatePicker("Date:", selection: $note.noteAdded, displayedComponents: [.date, .hourAndMinute])
                .padding(.horizontal)
                .foregroundStyle(.primary)
            
            // list of tags
            VStack(alignment: .leading, spacing: 10) {
                Text("List of tags:")
                    .padding(.leading)
               
                GridTagList
           
            }
            
            // Update note button
            updateNoteButton
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Update Note")
    }
}

#Preview {
    UpdateNoteView(note: Note.sampleNotes[1])
}

extension UpdateNoteView {
    private var GridTagList: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 10) {
            ForEach(Tags.allCases, id: \.rawValue) { tag in
                var isTagSelected: Bool {
                    note.tags.contains(tag)
                }
                Text(tag.rawValue)
                    .font(.footnote)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(isTagSelected ? tag.tagColor.opacity(0.2) : Color.gray.opacity(0.2), in: .rect(cornerRadius: 10))
                    .lineLimit(1) // Ensure text stays on one line
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(tag.tagColor, lineWidth: isTagSelected ? 2 : 0)
                    })
                    .onTapGesture {
                        withAnimation(.smooth) {
                            if note.tags.contains(tag) {
                                note.tags.removeAll { $0 == tag }
                            } else {
                                note.tags.append(tag)
                            }
                        }
                    }
                   
            }
        }
        .padding(.horizontal)
        .foregroundStyle(.secondary)
    }
    
    private var updateNoteButton: some View {
        Button {
            dismiss()
        } label: {
            Text("Update Note")
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 10))
        .padding(.horizontal, 30)
        .buttonStyle(.plain)
        .padding(.top, 20)
    }
}
