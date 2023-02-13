//
//  CharactersAdapter.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation

protocol CharactersAdapter {
    func getCharacters() async -> HttpResponse
    
    func getCharactersByPage(url: String) async -> HttpResponse
}
