//
//  RentViewModel.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//

import Foundation
import CoreData
import Firebase

class RentViewModel: ObservableObject {
    @Published var rents: [RentEntity] = []
    let dataController = DataController.instance
    
    init() {
        fetchRents()
    }
    
    func fetchRents() {
        let request = NSFetchRequest<RentEntity>(entityName: "RentEntity")
        
        do {
            rents = try dataController.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func addRent() {
        _ = RentEntity(context: dataController.context)
        saveData()
    }
    
    func deleteAllData() {
        
        let context = dataController.context
        
        for rent in rents {
            context.delete(rent)
        }
        
        saveData()
    }
    
    func updateData() {
        
    }
    
    func saveData() {
        dataController.saveData()
        fetchRents()
    }
    
    //Firebase test
    @Published var rentList: [Rent] = []
    
    func getData() {
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("rents").getDocuments { snapshot, error in
            
            // Check for errors
            if error == nil {
                // No errors
                
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.rentList = snapshot.documents.map { d in
                            
                            // Create a Todo item for each document returned
                            return Rent(id: d.documentID,
                                        location: d["location"] as? String ?? "",
                                        duration: d["duration"] as? Int ?? 0,
                                        timestamp: d["timestamp"] as? Date ?? Date.now,
                                        isLocked: d["isLocked"] as? Bool ?? false,
                                        username: d["username"] as? String ?? "Unknown")
                        }
                    }
                    
                    
                }
            }
            else {
                // Handle the error
            }
        }
    }
    
    func addData(location: String, duration: Int, username: String) {
            
            // Get a reference to the database
            let db = Firestore.firestore()
            
            // Add a document to a collection
            db.collection("rents").addDocument(data: ["location":location,
                                                      "duration":duration,
                                                      "isLocked": true,
                                                      "timestamp": Date.now,
                                                      "username": username]) { error in
                // Check for errors
                if error == nil {
                    // No errors
                    
                    // Call get data to retrieve latest data
                    self.getData()
                }
                else {
                    // Handle the error
                }
            }
        }
    
    func updateData(rentToUpdate: Rent) {
         
         // Get a reference to the database
         let db = Firestore.firestore()
         
         // Set the data to update
         db.collection("rents").document(rentToUpdate.id).setData(["isLocked":false], merge: true) { error in
             
             // Check for errors
             if error == nil {
                 // Get the new data
                 self.getData()
             }
         }
     }
}
