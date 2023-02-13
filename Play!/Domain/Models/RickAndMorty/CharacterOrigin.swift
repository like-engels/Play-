//
//  CharacterOrigin.swift
//  Play!
//
//  Created by Higashikata Maverick on 11/2/23.
//

import Foundation

struct CharacterOrigin {
    let name: String
    let url: String
    
    static func fromDictionary(dictionary: [String: Any]) -> CharacterOrigin {
        CharacterOrigin(name: dictionary["name"] as! String,
                          url: dictionary["url"] as! String)
    }
    
}
