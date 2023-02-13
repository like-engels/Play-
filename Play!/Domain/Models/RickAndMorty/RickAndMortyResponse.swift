//
//  RickAndMortyResponse.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation

struct RickAndMortyResponse {
    let info: ResponseInfo
    let characters: [Character]
    
    static func fromDictionary(dictionary: [String: Any]) -> RickAndMortyResponse {
        RickAndMortyResponse(info: ResponseInfo.fromDictionary(dictionary: dictionary["info"] as! [String : Any]),
                             characters: (dictionary["results"] as! [[String: Any]]).map{ character in Character.fromDictionary(dictionary: character)})
    }
    
    
}
