//
//  CharacterRow.swift
//  Play!
//
//  Created by Higashikata Maverick on 12/2/23.
//

import SwiftUI

struct CharacterRow: View {
    let name: String
    let description: String

    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(description)
        }
        .padding(.horizontal, 10)
    }
}
