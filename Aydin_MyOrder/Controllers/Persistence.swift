//
//  Persistence.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-10-15.
//

import Foundation
import CoreData

struct PersistenceController{
    //singleton instance
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        return result
    }()
    
    let container : NSPersistentContainer
    
    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "MyOrder")
        
        if inMemory{
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError?{
                print("Unable to access CoreData MyOrder \(error)")
            }
        })
        
    }
}
