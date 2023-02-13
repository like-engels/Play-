//
//  LoginView.swift
//  Play!
//
//  Created by Higashikata Maverick on 24/1/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var bindings: LoginBindings = LoginBindings()

    var body: some View {
        Group {
            if !bindings.isLoginValid {
                VStack {
                    Spacer()
                    Text("Login into the fake Account")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                    
                    Spacer()
                    
                    TextField("Email", text: $bindings.email)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)

                    SecureField("Password", text: $bindings.password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 20)
                    
                    Spacer()

                    if !bindings.isLoading {
                        Button("Login") {
                            bindings.login()
                        }
                        .cornerRadius(10.0)
                    } else {
                        ProgressView {
                            Text("login...")
                        }
                    }
                    
                    Spacer()

                }
                .alert("Error", isPresented: $bindings.isAlertActive) {
                } message: {
                    Text(bindings.message)
                }
            } else {
                let provider = CharactersProvider()
                let repository = CharacterRepository(provider: provider)
                let viewModel = CharactersListViewModel(repository: repository)
                let bindings = CharactersListBindings(viewModel: viewModel)
                CharactersListView(bindings: bindings)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
