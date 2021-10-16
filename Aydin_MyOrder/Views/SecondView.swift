//
//  SecondView.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-30.
//  Studend ID: 991521740

import SwiftUI

struct SecondView: View {
//    var orderList = [Order]()
    @EnvironmentObject var coreDBHelper: CoreDBHelper
    
    var body: some View {
        
            VStack{
                if (self.coreDBHelper.orderList.count > 0){
                List{
                    Section(header: Text("My Orders")){
                        ForEach(self.coreDBHelper.orderList.enumerated().map({$0}), id: \.element.self){indx, currentOrder in
                            NavigationLink(destination: OrderDetailsView(selectedOrderIndex: indx)){
                                ListRowView(order:currentOrder)
                                    .onTapGesture {
                                        print("\(self.coreDBHelper.orderList[indx]) selected")
                                    }
                            }
                        }//foreach
                        .onDelete(perform: {indexSet in
                            for index in indexSet {
                                //ask for confirmation and then delete
                                self.coreDBHelper.deleteOrder(orderID: self.coreDBHelper.orderList[index].id)
                                self.coreDBHelper.orderList.remove(atOffsets: indexSet)
                            }
                            
                            
                        })
                    }//section
                }
            }
            }
            .onAppear(){
                self.coreDBHelper.getAllOrders()
            }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}

struct ListRowView: View{
    var order: OrderMO
    @EnvironmentObject var coreDBHelper: CoreDBHelper
    
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
        }.onAppear(){self.coreDBHelper.getAllOrders()}
    }
}
