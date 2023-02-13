//
//  CharactersRepository.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation

class CharacterRepository {
    let provider: CharactersProvider
    
    var characters: [Character]?
    var currentResponseInfo: ResponseInfo?
    
    init(provider: CharactersProvider) {
        self.provider = provider
    }
    
    func getCharacters() async -> HttpResponse {
        let response = await provider.getCharacters()
        
        if (!response.isOK) {
            return HttpResponse(isOK: false, body: nil, message: response.message)
        }
        
        guard let json = response.body as? [String: Any] else { return HttpResponse(isOK: false, body: nil, message: "Conversion went wrong")}
        
        let data = RickAndMortyResponse.fromDictionary(dictionary: json)
        
        self.characters = data.characters
        self.currentResponseInfo = data.info
        
        return HttpResponse(isOK: true, body: nil, message: nil)
    }
    
    func getCharactersByPage(url: String) async -> HttpResponse {
        let response = await provider.getCharactersByPage(url: url)
        
        if (!response.isOK) {
            return HttpResponse(isOK: false, body: nil, message: response.message)
        }
        
        guard let json = response.body as? [String: Any] else { return HttpResponse(isOK: false, body: nil, message: "Conversion went wrong")}
        
        let data = RickAndMortyResponse.fromDictionary(dictionary: json)
        
        self.characters = data.characters
        self.currentResponseInfo = data.info
        
        return HttpResponse(isOK: true, body: nil, message: nil)
    }
}
