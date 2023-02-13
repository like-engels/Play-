//
//  CharactersListBindings.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation
import Combine

class CharactersListBindings: ObservableObject {
    let viewModel: CharactersListViewModel
    
    @Published var state: CharactersListViewModelState = .loading
    @Published var store = Set<AnyCancellable>()
    var errorMessage = ""
    
    init(viewModel: CharactersListViewModel) {
        self.viewModel = viewModel
    }
    
    func getCharacters() {
        let response = viewModel.getCharacters()
        
        response.receive(on: DispatchQueue.main)
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { state in
                self.state = state
            }
            .store(in: &store)


    }
}
