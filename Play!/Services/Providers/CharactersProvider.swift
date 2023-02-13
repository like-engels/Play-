//
//  CharactersProvider.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation

class CharactersProvider: CharactersAdapter {
    func getCharacters() async -> HttpResponse {
        let url = URL(string: "https://rickandmortyapi.com/api/character")
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        do {
            let data = try await HttpClient.shared.rawRequest(from: request).value
            return HttpResponse(isOK: true, body: data, message: nil)
        } catch let error {
            return HttpResponse(isOK: false, body: nil, message: error.localizedDescription)
        }
        
    }
    
    func getCharactersByPage(url: String) async -> HttpResponse {
        let url = URL(string: url)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        do {
            let data = try await HttpClient.shared.rawRequest(from: request).value
            return HttpResponse(isOK: true, body: data, message: nil)
        } catch let error {
            return HttpResponse(isOK: false, body: nil, message: error.localizedDescription)
        }
    }
    
}
