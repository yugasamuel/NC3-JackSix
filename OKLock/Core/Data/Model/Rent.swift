//
//  Rent.swift
//  OKLock
//
//  Created by Yuga Samuel on 20/07/23.
//

import Foundation

struct Rent: Identifiable {
    var id: String
    var location: String
    var duration: Int
    var timestamp: Date
    var isLocked: Bool
    var username: String
    
    var formattedTimestamp: String {
        timestamp.formatted(date: .abbreviated, time: .shortened)
    }
    
    static let example = Rent(id: UUID().uuidString, location: "Lebak Bulus Grab", duration: 2, timestamp: Date.now, isLocked: true, username: "Yuga")
}




struct scannedUUID: Identifiable{
    var id = UUID()
    var UUIDScanned: String

    init(UUIDScanned:String) {
        self.UUIDScanned = UUIDScanned
        
    }
}

extension scannedUUID {
    static var sampleData: [scannedUUID] {
        [
            
        ]

    }
}

func addToScannedUUID(UUIDScanned:String) {
    let newUsersData = scannedUUID(UUIDScanned: UUIDScanned)
    scannedUUIDArray.append(newUsersData)
}
var scannedUUIDArray = scannedUUID.sampleData
