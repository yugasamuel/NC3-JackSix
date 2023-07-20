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
}
