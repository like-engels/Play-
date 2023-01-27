//
//  LoginViewModel.swift
//  Play!
//
//  Created by Higashikata Maverick on 24/1/23.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    let repo: LoginRepository
    
    init(repo: LoginRepository) {
        self.repo = repo
    }
    
    func login(email: String, password: String) async -> LoginEvents {
        let data = await repo.login(email: email, password: password)
        
        if (!data.isOK) {
            return LoginEvents.failed(data.message ?? "Unknown error")
        }
        
        return LoginEvents.success
        
    }
}

enum LoginEvents {
    case success
    case failed(_ message: String)
}
