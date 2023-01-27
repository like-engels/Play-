//
//  Play_App.swift
//  Play!
//
//  Created by Higashikata Maverick on 24/1/23.
//

import SwiftUI

@main
struct Play_App: App {
    let context = RouterContext()
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
