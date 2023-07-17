//
//  DataController.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//

import Foundation
import CoreData

class DataController {
    static let instance = DataController()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "OKLock")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error.localizedDescription)")
            } else {
                print("Successfully loaded Core Data.")
            }
        }
        context = container.viewContext
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving, \(error.localizedDescription)")
        }
    }
}
