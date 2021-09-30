//
//  FirstView.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-29.
//

import SwiftUI

enum Type: String {
    case darkRoast
    case originalBlend
    case vanilla
    
    var id: String { self.rawValue }
}

enum Size: String {
    case small
    case medium
    case large
    
    var id: String { self.rawValue }
}

struct FirstView: View {
    @State private var selectedType = Type.darkRoast
    @State private var selectedSize = Size.small
    @State private var tfQuantity : String = ""
    @State private var orderList = [Order]()
    
    @State private var selection : Int? = nil
    
    var body: some View {
        NavigationView{
        VStack{
            NavigationLink(destination: SecondView(orderList: orderList), tag: 1, selection: $selection){}
            Text("Type:")
            Picker("Type", selection: $selectedType) {
                Text("Dark Roast").tag(Type.darkRoast)
                Text("Original Blend").tag(Type.originalBlend)
                Text("Vanilla").tag(Type.vanilla)
            }
            Text("Selected Type: \(selectedType.rawValue)")
            
            Picker("Size", selection: $selectedSize) {
                Text("Small").tag(Size.small)
                Text("Medium").tag(Size.medium)
                Text("Large").tag(Size.large)
            }
            Text("Selected Size: \(selectedSize.rawValue)")
            
            TextField("Enter Quantity", text: $tfQuantity).keyboardType(.numberPad)
            
            Button(action: {
                let quantity = Int(tfQuantity)
                let currentOrder = Order(type: selectedType.rawValue, size: selectedSize.rawValue, quantity: quantity!)
                self.orderList.append(currentOrder)
                print(orderList)
            }){
                Text("Place Order")
            }
        }
        .navigationBarItems(trailing: Button(action: {
            self.selection = 1;
        }){
                                Text("My Orders")
                                Image(systemName: "list.bullet.rectangle.portrait")})
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
