//
//  CharactersListView.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import SwiftUI

struct CharactersListView: View {
    @ObservedObject var bindings: CharactersListBindings
    var body: some View {
        NavigationStack {
            switch bindings.state {
            case .loading:
                ProgressView {
                    Text("Loading data...")
                }
            case .error(let message):
                Text(message)
            case .success:
                charactersList
            }
        }
        .navigationSplitViewStyle(.prominentDetail)
        .onAppear {
            bindings.getCharacters()
        }
    }
    
    @ViewBuilder var charactersList: some View {
        List(bindings.viewModel.repository.characters ?? [], id: \.self) { item in
            NavigationLink(value: item) {
                CharacterRow(name: item.name, description: item.status)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Characters")
        .navigationDestination(for: Character.self) { character in
            CharacterDetailsView(character: character)
        }
    }
    
    
}
