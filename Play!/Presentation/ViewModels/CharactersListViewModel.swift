//
//  CharactersListViewModel.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation
import Combine

class CharactersListViewModel: ObservableObject {
    let repository: CharacterRepository
    
    init(repository: CharacterRepository) {
        self.repository = repository
    }
    
    func getCharacters() -> Future<CharactersListViewModelState, Error> {
        return Future { promise in
            Task {
                let data = await self.repository.getCharacters()
                
                if (!data.isOK) {
                    promise(Result.failure(Failure(message: data.message!)))
                }
                
                promise(Result.success(CharactersListViewModelState.success))
            }
        }
    }
    
    
}

enum CharactersListViewModelState: Equatable {
    case loading
    case error(_ message: String)
    case success
}
