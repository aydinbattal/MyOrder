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
    
    func insertOrder(newOrder: Order){
        do{
            //1. obtain the object of NSEntityDescription
            let orderToBeInserted = NSEntityDescription.insertNewObject(forEntityName: self.ENTITY_NAME, into: self.moc) as! OrderMO
            //2. assign values to be inserted to the object reference
            orderToBeInserted.type = newOrder.type
            orderToBeInserted.size = newOrder.size
            orderToBeInserted.quantity = newOrder.quantity
            orderToBeInserted.id = UUID()
            orderToBeInserted.date = Date()
            //3. save the object to the db
            if self.moc.hasChanges{
                try self.moc.save()
                print(#function, "Order successfully added to DB")
            }
            
        }catch let error as NSError{
            print(#function, "Could not insert order successfulyy \(error)")
        }
    }
    
    func getAllOrders(){
        let fetchRequest = NSFetchRequest<OrderMO>(entityName: self.ENTITY_NAME)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "date", ascending: false)]
        
        do{
            let result = try self.moc.fetch(fetchRequest)
            print(#function, "Number of records fetched: \(result.count)")
            self.orderList.removeAll()
            self.orderList.insert(contentsOf: result, at: 0)
            print(#function, "Result from DB: \(result)")
        }catch let error as NSError{
            print(#function, "Couldn't fetch data from DB \(error)")
        }
    }
    
    private func searchOrder(orderID: UUID) -> OrderMO?{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY_NAME)
        let predicateID = NSPredicate(format: "id == %@", orderID as CVarArg)
        fetchRequest.predicate = predicateID
        
        do{
            let result = try self.moc.fetch(fetchRequest)
            
            if result.count > 0{
                return result.first as? OrderMO
            }
        }catch let error as NSError{
            print(#function, "Unable to search for given ID \(error)")
        }
        
        return nil
        
    }
    
    func updateOrder(updatedOrder: OrderMO){
        let searchResult = self.searchOrder(orderID: updatedOrder.id as UUID)
        
        if(searchResult != nil){
            //if matching object found
            do{
                let orderToUpdate = searchResult!
                orderToUpdate.type = updatedOrder.type
                orderToUpdate.size = updatedOrder.size
                orderToUpdate.quantity = updatedOrder.quantity
                
                try self.moc.save()
//                objectWillChange.send()
                
                print(#function, "Data updated successfully")
            }catch let error as NSError{
                print(#function, "Unable to search for given ID \(error)")
            }
            
        }else{
            print(#function, "No matching record for given orderID \(updatedOrder.id)")
        }
    }
    
    func deleteOrder(orderID: UUID){
        let searchResult = self.searchOrder(orderID: orderID)
        
        if(searchResult != nil){
            //if matching object found
            do{
                self.moc.delete(searchResult!)
                
                try self.moc.save()
                
                print(#function, "Data deleted successfully")
            }catch let error as NSError{
                print(#function, "Unable to search for given ID \(error)")
            }
            
        }else{
            print(#function, "No matching record for given orderID \(orderID)")
        }
    }
}
