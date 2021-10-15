//
//  Order.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-29.
//  Studend ID: 991521740

import Foundation

struct Order: Hashable{
    var id = UUID()
    var type: String = ""
    var size: String = ""
    var quantity: Int = 0
    
    init() {
        
    }
    
    init(type: String, size: String, quantity: Int) {
        self.type = type
        self.size = size
        self.quantity = quantity
    }
}
