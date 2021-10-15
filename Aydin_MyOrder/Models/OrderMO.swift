//
//  OrderMO.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-10-15.
//

import Foundation
import CoreData

@objc(OrderMO)
final class OrderMO: NSManagedObject {
    @NSManaged var id: UUID
    @NSManaged var quantity: Int
    @NSManaged var size: String
    @NSManaged var type: String
    @NSManaged var date: Date
}

extension OrderMO{
    func convertToOrder() -> Order {
        Order(type: type, size: size, quantity: quantity)
    }
}
