//
//  OKLockApp.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//

import SwiftUI
import Firebase

@main
struct OKLockApp: App {
    @StateObject var rentViewModel = RentViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environmentObject(rentViewModel)
            QRReaderView()
//            QRGeneratorView()
//            FirebaseTest()
//                .environmentObject(rentViewModel)
        }
    }
}
