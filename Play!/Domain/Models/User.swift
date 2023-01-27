//
//  User.swift
//  BlockBits
//
//  Created by Higashikata Maverick on 17/1/23.
//

import Foundation

struct User {
    let email: String
    let pasword: String
    let avatar: String
    let fname: String
    let lname: String
    let id: String
    
    static func fromDictionary(dictionary: [String: String]) -> User {
        User(
            email: dictionary["email"]!,
            pasword: dictionary["password"]!,
            avatar: dictionary["avatar"]!,
            fname: dictionary["fname"]!,
            lname: dictionary["lname"]!,
            id: dictionary["id"]!
        )
    }
}
