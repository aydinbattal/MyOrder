//
//  SecondView.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-30.
//

import SwiftUI

struct SecondView: View {
    var orderList = [Order]()
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Section(header: Text("My Orders")){
                        ForEach(self.orderList, id: \.id){currentOrder in
                            NavigationLink(destination: OrderDetailsView(order: currentOrder)){
//                                ListRowView(order:currentOrder)
                            }
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
