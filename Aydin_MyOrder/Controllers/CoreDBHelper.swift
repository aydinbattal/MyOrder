//
//  CoreDBHelper.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-10-15.
//

import Foundation

import CoreData

//MVC Controller

class CoreDBHelper : ObservableObject{
    @Published var orderList = [OrderMO]()
    private let ENTITY_NAME = "OrderMO"
    
    private let moc: NSManagedObjectContext
    
    //singleton istance
    private static var shared: CoreDBHelper?
    
    static func getInstance() -> CoreDBHelper{
        if shared == nil{
            shared = CoreDBHelper(context: PersistenceController.preview.container.viewContext)
        }
        return shared!
    }
    
    init(context: NSManagedObjectContext){
        self.moc = context
    }
}
