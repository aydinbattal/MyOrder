//
//  OrderDetailsView.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-29.
//  Studend ID: 991521740

import SwiftUI



struct OrderDetailsView: View {
    //    let order: Order
    @State private var type: String = ""
    @State private var size: String = ""
    @State private var quantity: String = ""
    @State private var selectedType = Type.darkRoast
    @State private var selectedSize = Size.small
    
    let selectedOrderIndex : Int
    @EnvironmentObject var coreDBHelper: CoreDBHelper
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Text("Order Details")
                .font(.title)
                .padding(50)
            
            Picker("Type", selection: $selectedType) {
                Text("Dark Roast").tag(Type.darkRoast)
                Text("Original Blend").tag(Type.originalBlend)
                Text("Vanilla").tag(Type.vanilla)
            }
            
            
            Picker("Size", selection: $selectedSize) {
                Text("Small").tag(Size.small)
                Text("Medium").tag(Size.medium)
                Text("Large").tag(Size.large)
            }
            
            Form{
                
                Text("\(selectedType.rawValue)")
                
                Text("\(selectedSize.rawValue)")
                
                TextField("Quantity:", text: self.$quantity)
                    .keyboardType(.numberPad)
            }
            
            Button(action: {
                self.updateOrder()
                self.presentationMode.wrappedValue.dismiss()
            }){
                Text("Update Order Details")
            }
            
            
            Spacer()
        }
        .onAppear(){
            self.type = self.coreDBHelper.orderList[selectedOrderIndex].type
            if(type == "Dark Roast"){
                selectedType = Type.darkRoast
            }
            if(type == "Original Blend"){
                selectedType = Type.originalBlend
            }
            if(type == "Vanilla"){
                selectedType = Type.vanilla
            }
            
            self.size = self.coreDBHelper.orderList[selectedOrderIndex].size
            if(size == "Small"){
                selectedSize = Size.small
            }
            if(size == "Medium"){
                selectedSize = Size.medium
            }
            if(size == "Large"){
                selectedSize = Size.large
            }
            
            self.quantity = String(self.coreDBHelper.orderList[selectedOrderIndex].quantity)
        }
    }
    
    private func updateOrder(){
        self.coreDBHelper.orderList[selectedOrderIndex].type = self.selectedType.rawValue
        self.coreDBHelper.orderList[selectedOrderIndex].size = self.selectedSize.rawValue
        self.coreDBHelper.orderList[selectedOrderIndex].quantity = Int(self.quantity)!
        
        self.coreDBHelper.updateOrder(updatedOrder: self.coreDBHelper.orderList[selectedOrderIndex])
    }
}

//struct OrderDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderDetailsView(order: Order(type: "Dark Roast", size: "Small", quantity: 1))
//    }
//}

