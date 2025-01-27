//
//  ContentView.swift
//  NoteTaking
//
//  Created by Elvis Rexha on 27/01/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showAddNoteView: Bool = false
    
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
                Text("Add note here")
                    .font(.title)
            }
            
        }
    }
}

#Preview {
    HomeView()
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
