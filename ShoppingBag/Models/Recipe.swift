//
//  Recipe.swift
//  ShoppingBag
//
//  Created by Tiago on 24/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//
import SwiftUI

class Recipe {
    var name: String
    var color: String
    var items: [Item]
    
    init(name: String, items: [Item]) {
        self.name = name
        self.items = items
        self.color = ""
        self.color = self.getRandomColor()
    }
    
    func getRandomColor() -> String {
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
        return color
    }
    
    static func getMock() -> [Recipe] {
        let number = Int.random(in: 0..<10)
        var recipes = [Recipe]()
        _ = Array(0...number).map { number in
            var items = [Item]()
            _ = Array(0...number).map { itemNumber in
                let item = Item(name: "Item # \(itemNumber)", quantity: itemNumber + 1)
                items.append(item)
            }
            let recipe = Recipe(name: "Recipe # \(number)", items: items)
            recipes.append(recipe)
        }
        return recipes
    }
}
