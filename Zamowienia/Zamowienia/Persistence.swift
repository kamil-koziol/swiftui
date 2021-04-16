//
//  Persistence.swift
//  Zamowienia
//
//  Created by Kamil Kozioł on 09/04/2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        let order1 = Order(context: viewContext)
        order1.username = "Kamil"
        order1.amount = 2
        order1.price = 20.0
        order1.date = Date()
        order1.addition1 = false;
        order1.addition2 = true;
        order1.addition3 = false;
        
        let order2 = Order(context: viewContext)
        order2.username = "Marcin"
        order2.amount = 3
        order2.price = 10.0
        order2.date = Date()
        order2.addition1 = false;
        order2.addition2 = false;
        order2.addition3 = false;
        
        let order3 = Order(context: viewContext)
        order3.username = "Bartek"
        order3.amount = 2
        order3.price = 30.0
        order3.date = Date()
        order3.addition1 = true;
        order3.addition2 = true;
        order3.addition3 = false;

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Zamowienia")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
