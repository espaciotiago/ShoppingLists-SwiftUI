//
//  CreateItemView.swift
//  ShoppingBag
//
//  Created by Tiago on 25/09/20.
//  Copyright © 2020 Tiago. All rights reserved.
//

import SwiftUI

struct CreateItemView: View {
    
    @State var itemName = ""
    @State var itemQty = ""
    @Binding var showItemCreationModal: Bool
    let onItemCreated: (_ name: String, _ qty: Int) -> Void
    
    var body: some View {
        ZStack{
            Color("BlueCard")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ZStack(alignment: .center) {
                        if self.itemName.isEmpty {
                            Text("What item you need?")
                                .font(.title)
                                .foregroundColor(Color("Placeholder")) }
                        TextField("", text: self.$itemName)
                            .multilineTextAlignment(.trailing)
                            .font(.largeTitle)
                            .foregroundColor(Color("Main"))
                    }
                    
                    ZStack(alignment: .center) {
                        if self.itemQty.isEmpty {
                            Text("How many do you need?")
                                .font(.title)
                                .foregroundColor(Color("Placeholder")) }
                        TextField("", text: self.$itemQty)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.trailing)
                            .font(.largeTitle)
                            .foregroundColor(Color("Main"))
                    }
                    Button(action: {
                        self.onItemCreated(self.itemName, (self.itemQty as NSString).integerValue)
                    }, label: {
                        HStack{
                            Image(systemName: "plus")
                            Text("Save item")
                        }
                    })
                        .foregroundColor(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
            }
        }
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView(showItemCreationModal: .constant(false), onItemCreated: {_,_  in })
    }
}
