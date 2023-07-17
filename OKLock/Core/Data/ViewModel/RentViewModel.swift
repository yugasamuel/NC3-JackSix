//
//  RentViewModel.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//

import Foundation
import CoreData

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
    
    func saveData() {
        dataController.saveData()
        fetchRents()
    }
}
