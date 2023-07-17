//
//  ContentView.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RentViewModel())
    }
}
