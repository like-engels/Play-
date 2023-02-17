//
//  CharacterDetailsView.swift
//  Play!
//
//  Created by Higashikata Maverick on 12/2/23.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: Character
    let colour: Color
    
    private let colourPalette: [String: Color] = [
        "unknown": .gray,
        "Alive": .green,
        "Dead": .red
    ]
    
    init(character: Character) {
        self.character = character
        self.colour = colourPalette[character.status] ?? .gray
    }
    
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
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                Text(character.gender)
                HStack {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(colour)
                    Text(character.status)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            header
                .padding(.all, 30)
            
            VStack(alignment: .leading) {
                Text("Species: \(character.species)")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                
                Text("Gender: \(character.gender)")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                
                Text("From: \(character.origin.name)")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                
                Text("Located at: \(character.location.name)")
                    .font(.system(size: 18, weight: .medium, design: .rounded))
            }
            .padding(.horizontal, 30)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
        }
    }
}
