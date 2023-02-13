//
//  RickAndMortyCharacters.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation

struct Character {
    let uid = UUID().uuidString
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let image: String
    let created: String
    
    static func fromDictionary(dictionary: [String: Any]) -> Character {
        Character(id: dictionary["id"] as! Int,
                  name: dictionary["name"] as! String,
                  status: dictionary["status"] as! String,
                  species: dictionary["species"] as! String,
                  type: dictionary["type"] as! String,
                  gender: dictionary["gender"] as! String,
                  origin: CharacterOrigin.fromDictionary(dictionary: dictionary["origin"] as! [String: Any]),
                  location: CharacterLocation.fromDictionary(dictionary: dictionary["location"] as! [String: Any]),
                  image: dictionary["image"] as! String,
                  created: dictionary["created"] as! String)
    }
    
}

extension Character: Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
            return lhs.uid == rhs.uid && lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(uid)
        }
}
