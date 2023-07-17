//
//  RentEntity+CoreDataProperties.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//
//

import Foundation
import CoreData


extension RentEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RentEntity> {
        return NSFetchRequest<RentEntity>(entityName: "RentEntity")
    }
    
    @NSManaged public var identifier: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var location: String?
    @NSManaged public var duration: Int16
    @NSManaged public var isLocked: Bool
    @NSManaged public var username: String?
    
    var wrappedIdentifier: String {
        identifier ?? "N/A"
    }
    
    var formattedTimestamp: String {
        guard let timestampDate = timestamp else {
            return "N/A"
        }
        return timestampDate.formatted(date: .abbreviated, time: .omitted)
    }
    
    var wrappedLocation: String {
        location ?? "N/A"
    }
    
    var wrappedUsername: String {
        username ?? "Unknown"
    }
}

extension RentEntity : Identifiable {
    
}
