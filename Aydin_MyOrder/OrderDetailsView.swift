//
//  OrderDetailsView.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-29.
//  Studend ID: 991521740

import SwiftUI

struct OrderDetailsView: View {
    let order: Order
    
    var body: some View {
        VStack{
            Text("Order Details")
                .font(.title)
                .padding(50)
            
            Text("Type: \(self.order.type)")
                .padding(20)
            
            Text("Size: \(self.order.size)")
                .padding(20)
            
            Text("Quantity: \(self.order.quantity)")
                .padding(20)
            
            Spacer()
        }
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView(order: Order(type: "Dark Roast", size: "Small", quantity: 1))
    }
}

