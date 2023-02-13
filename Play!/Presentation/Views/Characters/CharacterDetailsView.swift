//
//  CharacterDetailsView.swift
//  Play!
//
//  Created by Higashikata Maverick on 12/2/23.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: Character
    
    @ViewBuilder var header: some View {
        HStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView {
                    Text("Fetching image...")
                }
            }
            .frame(width: 120, height: 120)
            .cornerRadius(20)
            Spacer()
            VStack {
                Text(character.name)
                    .font(.system(size: 24, weight: .regular, design: .rounded))
                Text(character.gender)
                Text(character.status)
            }
        }
    }
    
    var body: some View {
        VStack {
            header
                .padding(.all, 30)
            Spacer()
        }
    }
}
