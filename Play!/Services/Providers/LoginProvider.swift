//
//  LoginProvider.swift
//  BlockBits
//
//  Created by Higashikata Maverick on 16/1/23.
//

import Foundation
import Combine

class LoginProvider: LoginAdapter {
    func login(email: String, password: String) async -> HttpResponse {
        let url = URL(string: "https://fake-login-api-production.up.railway.app/api/auth/login")
        
        let json = [
            "email": email,
            "password": password
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        
        do {
            let data = try await HttpClient.shared.rawRequest(from: request).value
            return HttpResponse(isOK: true, body: data, message: nil)
        } catch let error {
            return HttpResponse(isOK: false, body: nil, message: error.localizedDescription)
        }
    }
}
