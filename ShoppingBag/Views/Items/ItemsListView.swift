//
//  RecipientDetailView.swift
//  ShoppingBag
//
//  Created by Tiago on 24/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import SwiftUI

struct ItemsListView: View {
    
    var recipe: RecipeViewModel
    @Binding var showDetails: Bool
    
    var body: some View {
        VStack{
            Text(self.recipe.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView {
                ForEach(self.recipe.items.indices, id: \.self) { index in
                    HStack{
                        Text(self.recipe.items[index].name)
                            .foregroundColor(Color.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        Text("x\(self.recipe.items[index].quantity)")
                            .foregroundColor(Color.white)
                    }.padding()
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(minHeight: 0, maxHeight: .infinity)
        }
        .padding(.vertical, 48)
        .padding(.horizontal, 16)
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(minHeight: 0, maxHeight: .infinity)
        .background(Color(self.recipe.color))
        .gesture(
            TapGesture()
                .onEnded { _ in
                    self.showDetails.toggle()
            }
        )
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView(recipe: RecipeViewModel(recipe: Recipe.getMock()[0]), showDetails: .constant(false))
    }
}
