//
//  ContentView.swift
//  ShoppingBag
//
//  Created by Tiago on 25/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var recipesListViewModel = RecipesListViewModel()
    @State var selectedRecipeIndex = 0
    @State var showDetails = false
    
    var body: some View {
        ZStack{
            NavigationView{
                ZStack{
                    Color("Main")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                    RecipesListView(recipes: recipesListViewModel.recipes, selectedRecipeIndex: self.$selectedRecipeIndex, showDetails: self.$showDetails)
                }
                .navigationBarTitle("My Shopping lists")
                .navigationBarColor(UIColor(named: "Main"))
                .navigationBarItems(trailing: NavigationLink(
                    destination: CreateRecipeView(){ recipeName, items in
                        self.recipesListViewModel.addRecipe(name: recipeName, items: items)
                    }
                ){
                    Image(systemName: "plus")
                        .foregroundColor(Color.white)
                })
            }
            
            if(!recipesListViewModel.recipes.isEmpty){
                ItemsListView(
                    recipe: recipesListViewModel.recipes[selectedRecipeIndex],
                    showDetails: self.$showDetails
                )
                    .frame(minHeight: 0, maxHeight: self.showDetails ? .infinity : 0)
                    .frame(minWidth: 0, maxWidth: self.showDetails ? .infinity : 0)
                    .cornerRadius(self.showDetails ? 0 : UIScreen.main.bounds.width)
                    .animation(.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
