//
//  RecipesListViewModel.swift
//  ShoppingBag
//
//  Created by Tiago on 25/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import Foundation

class RecipesListViewModel: ObservableObject {
    
    @Published var recipes = [RecipeViewModel]()
    @Published var selectedRecipe = RecipeViewModel(recipe: Recipe(name: "",items: []))
    
    init() {
        //fetchRecipes()
    }
    
    func fetchRecipes(){
        let recipesList = Recipe.getMock()
        self.recipes = recipesList.map(RecipeViewModel.init)
    }
    
    func addRecipe(name: String, items: [Item]){
        let recipe = RecipeViewModel(recipe: Recipe(name: name, items: items))
        self.recipes.append(recipe)
    }
    
}

class RecipeViewModel {
    
    let id = UUID()
    
    var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var name: String {
        set{
            recipe.name = newValue
        }
        get{
            return recipe.name
        }
    }
    
    var color: String {
        return recipe.color
    }
    
    var items: [Item] {
        return recipe.items
    }
    
}
