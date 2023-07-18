//
//  ContentView.swift
//  OKLock
//
//  Created by Yuga Samuel on 17/07/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var rentViewModel: RentViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(rentViewModel.rents) { rent in
                    HStack {
                        Text(rent.wrappedIdentifier)
                        Spacer()
                        Text(rent.wrappedUsername)
                    }
                }
            }
            .navigationTitle("OKLock")
            .toolbar(){
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        rentViewModel.addRent()
                    }, label: {
                        Text("Add dummy")
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button(action: {
                        rentViewModel.deleteAllData()
                    }, label: {
                        Text("Delete")
                    })
                }
                
            }
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
