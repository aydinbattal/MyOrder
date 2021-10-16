//
//  Aydin_MyOrderApp.swift
//  Aydin_MyOrder
//
//  Created by Aydin Battal on 2021-09-29.
//  Studend ID: 991521740

import SwiftUI

@main
struct Aydin_MyOrderApp: App {
    let persistenceController = PersistenceController.shared
    let coreDBHelper = CoreDBHelper(context: PersistenceController.shared.container.viewContext)
    
    var body: some Scene {
        WindowGroup {
            FirstView().environmentObject(coreDBHelper)
        }
    }
}
