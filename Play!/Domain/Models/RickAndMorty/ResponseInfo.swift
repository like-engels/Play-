//
//  RickAndMortyResponseInfo.swift
//  Play!
//
//  Created by Higashikata Maverick on 3/2/23.
//

import Foundation

struct ResponseInfo {
    let count: Int
    let pages: Int
    let next: String
    let previous: String?
    
    static func fromDictionary(dictionary: [String: Any]) -> ResponseInfo {
        ResponseInfo(count: dictionary["count"] as! Int,
                     pages: dictionary["pages"] as! Int,
                     next: dictionary["next"] as! String,
                     previous: dictionary["previous"] as? String)
    }
}
