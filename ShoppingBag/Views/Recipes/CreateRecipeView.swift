//
//  CreateRecipe.swift
//  ShoppingBag
//
//  Created by Tiago on 25/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import SwiftUI

struct CreateRecipeView: View {
    
    @ObservedObject var itemsListViewModel = ItemsListViewModel()
    @Environment(\.presentationMode) var presentation
    @State var listName = ""
    @State var showItemCreationModal = false
    let onRecipeCreated: (_ name: String, _ items: [Item]) -> Void
    
    var body: some View {
        ZStack{
            Color("Main")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ZStack(alignment: .center) {
                        if self.listName.isEmpty {
                            Text("Name for the list")
                                .font(.largeTitle)
                                .foregroundColor(Color("Placeholder")) }
                        TextField("", text: self.$listName)
                            .multilineTextAlignment(.trailing)
                            .font(.largeTitle)
                            .foregroundColor(Color("BlueCard"))
                    }
                    
                    Button(action: {
                        self.showItemCreationModal = true
                    }, label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Add item")
                        }
                    })
                        .foregroundColor(Color("YellowCard"))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    
                    ForEach(self.itemsListViewModel.items.indices, id: \.self){ index in
                        Text(self.itemsListViewModel.items[index].name)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            
            .sheet(isPresented: self.$showItemCreationModal, content: {
                CreateItemView(
                    showItemCreationModal: self.$showItemCreationModal,
                    onItemCreated: { itemName, itemQty in
                        self.itemsListViewModel.addItem(item: itemName, qty: itemQty)
                        self.showItemCreationModal = false
                })
            })
        }
        .navigationBarTitle("Create list", displayMode: .inline)
        .navigationBarColor(UIColor(named: "Main"))
        .navigationBarItems(trailing: Button(action: {
            self.onRecipeCreated(self.listName, self.itemsListViewModel.getItems())
            self.presentation.wrappedValue.dismiss()
        }, label: {
            Text("Save")
                .foregroundColor(Color.white)
        }))
    }
}

struct CreateRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRecipeView( onRecipeCreated: {_,_ in })
    }
}
