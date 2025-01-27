//
//  AddNoteView.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import SwiftUI

struct AddNoteView: View {
    // MARK: State properties for adding notes
    @State private var noteTitle: String = ""
    @State private var noteContent: String = ""
    @State private var noteAdded: Date = .now
    @State private var selectedTags: Set<Tags> = []
    
    // MARK: Environment properties
    @Environment(\.modelContext) private var ctx
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            CustomTextField(placeholder: "Note title", textBinding: $noteTitle)
            
            CustomTextField(placeholder: "Note content" ,textBinding: $noteContent)
                .lineLimit(8, reservesSpace: true)
            
            DatePicker("Note Added", selection: $noteAdded, displayedComponents: .hourAndMinute)
                .padding(.horizontal)
                .foregroundStyle(.secondary)
                .tint(.purple)
            
            // list of tags
            VStack(alignment: .leading, spacing: 10) {
                Text("List of tags:")
                    .padding(.leading)
                ScrollView(.horizontal) {
                    GridTagList
                }
                .scrollClipDisabled()
            }
            
            addNoteButton
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Add Note")
    }
    
    private func addTags(tag: Tags) {
        // check if tag exists in array
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
    
    private func addNote() {
        guard !noteTitle.isEmpty, !noteContent.isEmpty else { return }
        let selectedTags = Array(selectedTags)
        let newNote = Note(noteTitle: noteTitle, noteContent: noteContent, tags: selectedTags, noteAdded: noteAdded)
        ctx.insert(newNote)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            dismiss()
        }
    }
}

#Preview {
    AddNoteView()
}


extension AddNoteView {
    private var GridTagList: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 4)) {
            ForEach(Tags.allCases, id: \.rawValue) { tag in
                var isTagSelected: Bool {
                    selectedTags.contains(tag)
                }
                Text(tag.rawValue)
                    .font(.subheadline)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 20)
                    .background(isTagSelected ? Color.purple.opacity(0.2) : Color.gray.opacity(0.2), in: .rect(cornerRadius: 10))
                    .lineLimit(1)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.purple, lineWidth: isTagSelected ? 2 : 0)
                    })
                    .onTapGesture {
                        withAnimation(.smooth) {
                            addTags(tag: tag)
                        }
                    }
            }
        }
        .padding(.horizontal)
        .foregroundStyle(.secondary)
    }
    
    private var addNoteButton: some View {
        Button {
            addNote()
        } label: {
            Text("Add Note")
                .fontWeight(.semibold)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color.purple, in: .rect(cornerRadius: 10))
        .padding(.horizontal, 30)
        .buttonStyle(.plain)
        .padding(.top, 20)
    }
    
}
