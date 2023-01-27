//
//  LoginBindings.swift
//  Play!
//
//  Created by Higashikata Maverick on 24/1/23.
//

import Foundation

class LoginBindings: ObservableObject {
    var viewModel: LoginViewModel = LoginViewModel(repo: LoginRepository(provider: LoginProvider()))
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginValid: Bool = false
    @Published var isAlertActive: Bool = false
    @Published var isLoading: Bool = false
    var message: String = ""
    
    @MainActor func login() {
        Task {
            if (email.isEmpty || password.isEmpty) {
                self.message = "Your email or password is empty"
                self.isAlertActive = true
                return
            }
            
            self.isLoading = true
            
            let state = await viewModel.login(email: email, password: password)
            
            switch state {
            case .success:
                self.isLoading = false
                self.isLoginValid = true
            case .failed(let message):
                self.isLoading = false
                self.message = message
                self.isAlertActive = true
            }
        }
    }
    
}
