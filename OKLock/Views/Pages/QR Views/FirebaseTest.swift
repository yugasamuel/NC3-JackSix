//
//  FirebaseTest.swift
//  OKLock
//
//  Created by Yuga Samuel on 20/07/23.
//

import SwiftUI

struct FirebaseTest: View {
    @EnvironmentObject var rentViewModel: RentViewModel
    
    @State private var location = ""
    @State private var duration = 0
    @State private var username = ""

    var body: some View {
        VStack {
            List (rentViewModel.rentList) { rent in
                HStack {
                    Text(rent.id)
                    Text("\(rent.duration)")
                    Spacer()
                    
                    // Update button
                    Button(action: {
                        // Delete todo
                        rentViewModel.updateData(rentToUpdate: rent)
                    }, label: {
                        Image(systemName: "pencil")
                    })
                    
                }
            }
            
            Divider()
            
            VStack(spacing: 5) {
                
                TextField("location", text: $location)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("duration", value: $duration, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Call add data
                    rentViewModel.addData(location: location, duration: duration, username: username)
                    
                    // Clear the text fields
                    location = ""
                    duration = 0
                    username = ""
                    
                }, label: {
                    Text("Add Rent")
                })
            }
            .padding()
        }
        .task {
            rentViewModel.getData()
        }
    }
}

struct FirebaseTest_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseTest()
            .environmentObject(RentViewModel())
    }
}
