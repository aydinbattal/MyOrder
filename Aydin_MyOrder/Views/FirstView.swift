//
//  FirstView.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-29.
//  Studend ID: 991521740

import SwiftUI

struct FirstView: View {
    @State private var selectedType = Type.darkRoast
    @State private var selectedSize = Size.small
    @State private var tfQuantity : String = ""
    //    @State private var orderList = [Order]()
    
    @State private var selection : Int? = nil
    
    @EnvironmentObject var coreDBHelper: CoreDBHelper
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: SecondView(), tag: 1, selection: $selection){}
                Text("Customize Your Order")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding(50)
                    .frame(width: 500, alignment: .center)
                
                HStack{
                    Text("Type:").frame(width:125,alignment: .center)
                    Picker("Type", selection: $selectedType) {
                        Text("Dark Roast").tag(Type.darkRoast)
                        Text("Original Blend").tag(Type.originalBlend)
                        Text("Vanilla").tag(Type.vanilla)
                    }
                    .frame(width:125,alignment: .leading)
                    //            Text("Selected Type: \(selectedType.rawValue)")
                }
                
                HStack{
                    Text("Size:").frame(width:125,alignment: .center)
                    Picker("Size", selection: $selectedSize) {
                        Text("Small").tag(Size.small)
                        Text("Medium").tag(Size.medium)
                        Text("Large").tag(Size.large)
                    }
                    .frame(width:125,alignment: .leading)
                    //            Text("Selected Size: \(selectedSize.rawValue)")
                }
                
                HStack{
                    
                    Text("Quantity:").frame(width:125,alignment: .center)
                    
                    TextField("Enter Quantity", text: $tfQuantity).keyboardType(.numberPad).frame(width:125,alignment: .leading)
                    
                    
                }
                //                .frame(width: 200, alignment: .center)
                
                
                Spacer()
                
                Button(action: {
                    self.addNewOrder()
                }){
                    Text("Place Order")
                }
            }
            .navigationTitle(Text("Coffee Shop"))
            .navigationBarItems(trailing: Button(action: {
                self.selection = 1;
            }){
                //                                Text("My Orders")
                Image(systemName: "list.bullet.rectangle.portrait")})
        }//navview
        
    }//body
    
    private func addNewOrder(){
        let quantity = Int(tfQuantity)
        
        if(!self.selectedType.rawValue.isEmpty && !self.selectedSize.rawValue.isEmpty && !(quantity == nil)){
            self.coreDBHelper.insertOrder(newOrder: Order(type: selectedType.rawValue, size: selectedSize.rawValue, quantity: quantity!))
        }else{
            print(#function, "Nothing can be empty")
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
