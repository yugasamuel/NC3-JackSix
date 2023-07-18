//
//  OKLockApp.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//

import SwiftUI

@main
struct OKLockApp: App {
    @StateObject var rentViewModel = RentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(rentViewModel)
            QRReaderView()
        }
    }
}
