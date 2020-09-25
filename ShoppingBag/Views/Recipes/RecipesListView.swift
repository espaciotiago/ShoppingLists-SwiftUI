//
//  ContentView.swift
//  ShoppingBag
//
//  Created by Tiago on 24/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import SwiftUI

struct RecipesListView: View {
    
    var recipes: [RecipeViewModel]
    @Binding var selectedRecipeIndex: Int
    @Binding var showDetails: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 20){
                ForEach(recipes.indices, id: \.self) { recipeIndex in
                    GeometryReader { geometry in
                        RecipeCard(recipe: self.recipes[recipeIndex].name, color: self.recipes[recipeIndex].color)
                            .rotation3DEffect(Angle(degrees:
                                Double((geometry.frame(in: .global).minX - 16) / 20)
                            ), axis: (x: 5.0, y: -8.0, z: -1))
                            .gesture(
                                TapGesture()
                                    .onEnded { _ in
                                        self.selectedRecipeIndex = recipeIndex
                                        self.showDetails.toggle()
                                }
                        )
                    }
                    .frame(width: 290, alignment: .center)
                    .frame(minHeight: 0, maxHeight: 500)
                }
            }
            .padding()
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView(recipes: [RecipeViewModel(recipe: Recipe(name: "Mi receta", items: []))], selectedRecipeIndex: .constant(0), showDetails: .constant(false))
    }
}
