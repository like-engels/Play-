//
//  LoginAdapter.swift
//  BlockBits
//
//  Created by Higashikata Maverick on 16/1/23.
//

import Foundation
import Combine

protocol LoginAdapter {
    func login(email: String, password: String) async -> HttpResponse
}
