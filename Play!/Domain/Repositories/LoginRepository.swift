//
//  LoginRepository.swift
//  Play!
//
//  Created by Higashikata Maverick on 26/1/23.
//

import Foundation

class LoginRepository {
    let provider: LoginAdapter
    
    var currentUser: User?
    
    init(provider: LoginAdapter) {
        self.provider = provider
    }
    
    func login(email: String, password: String) async -> HttpResponse {
        let response = await provider.login(email: email, password: password)
        
        if (!response.isOK) {
            return HttpResponse(isOK: false, body: nil, message: response.message)
        }
        
        guard let json = response.body as? Dictionary<String, Any> else { return HttpResponse(isOK: false, body: nil, message: "Conversion went wrong")}
        
        if (json["ok"] as! Bool == false) {
            return HttpResponse(isOK: false, body: nil, message: json["error"] as? String)
        }
        
        let user = User.fromDictionary(dictionary: (json["user"] as? Dictionary<String, String>)!)
        
        self.currentUser = user
        
        return HttpResponse(isOK: true, body: user, message: nil)
    }
}
