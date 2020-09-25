//
//  RecipeCard.swift
//  ShoppingBag
//
//  Created by Tiago on 24/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import SwiftUI

struct RecipeCard: View {
    
    var recipe: String
    var color: String
    
    var body: some View {
        GeometryReader { (geometry) in
            VStack{
                Text(self.recipe)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Text("@espaciotiago")
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(24)
            .background(Color(self.color))
            .cornerRadius(25)
            .shadow(radius: 3)
        }
    }
    
    func getRandomColor() -> Color{
        let number = Int.random(in: 0..<4)
        var color = "PinkCard"
        switch number {
        case 1:
            color = "GreenCard"
            break
        case 2:
            color = "YellowCard"
            break
        case 3:
            color = "BlueCard"
            break
        default:
            color = "PinkCard"
            break
        }
        return Color(color)
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: "Happy Brownies", color: "BlueCard")
    }
}
