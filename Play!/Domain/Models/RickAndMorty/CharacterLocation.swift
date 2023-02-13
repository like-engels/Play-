//
//  CharacterLocation.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation

struct CharacterLocation {
    let name: String
    let url: String
    
    static func fromDictionary(dictionary: [String: Any]) -> CharacterLocation {
        CharacterLocation(name: dictionary["name"] as! String,
                          url: dictionary["url"] as! String)
    }
    
}
