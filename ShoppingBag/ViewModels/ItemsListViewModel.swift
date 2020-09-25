//
//  RecipesListViewModel.swift
//  ShoppingBag
//
//  Created by Tiago on 25/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import Foundation

class ItemsListViewModel: ObservableObject {
    
    @Published var items = [ItemViewModel]()
    
    func addItem(item: String, qty: Int){
        let item = ItemViewModel(item: Item(name: item,quantity: qty))
        items.append(item)
    }
    
    func getItems() -> [Item] {
        return items.map({$0.item})
    }
}

class ItemViewModel {
    
    let id = UUID()
    
    var item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    var name: String {
        return item.name
    }
    
    var quantity: Int {
        return item.quantity
    }
    
}

