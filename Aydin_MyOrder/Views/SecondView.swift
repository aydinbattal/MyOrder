//
//  SecondView.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-30.
//  Studend ID: 991521740

import SwiftUI

struct SecondView: View {
    var orderList = [Order]()
    
    var body: some View {
        
            VStack{
                List{
                    Section(header: Text("My Orders")){
                        ForEach(self.orderList, id: \.id){currentOrder in
                            NavigationLink(destination: OrderDetailsView(order: currentOrder)){
                                ListRowView(order:currentOrder)
                            }
                        }
                    }
                }
            }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

struct ListRowView: View{
    var order: Order
    
    var body: some View{
        VStack(alignment: .leading){
            Text("\(order.type)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Text("\(order.size)")
                .font(.callout)
                .italic()
            
            Text("\(order.quantity)")
                .font(.callout)
                .italic()
        }
    }
}
