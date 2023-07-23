//
//  LockerDetailView.swift
//  OKLock
//
//  Created by Yuga Samuel on 23/07/23.
//

import SwiftUI

struct LockerDetailView: View {
    @EnvironmentObject var rentViewModel: RentViewModel
    var rent: Rent
    
//    var rentIndex: Int {
//        rentViewModel.rentList.firstIndex(where: { $0.id == rent.id }) ?? 0
//    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Loker 14A")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 40)
            
            HStack {
                Image(systemName: "mappin")
                    .font(.title3)
                Text(rent.location)
                    .font(.title3)
            }
            
            Image("QR")
                .resizable()
                .scaledToFit()
                .frame(width: 240)
                .padding()
            
            Text("Aktif hingga \(rent.formattedTimestamp)")
                .font(.title3)
                .padding(.bottom, 50)
            
            HStack {
                Image(systemName: "clock")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(8)
                    .background(.yellow)
                    .cornerRadius(5)
                Text("Perpanjang Masa Pinjaman")
                Spacer()
                Image(systemName: "arrow.right")
                    .font(.title3)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.size.width - 40)
            .background(.secondary.opacity(0.2))
            .cornerRadius(8, corners: [.topLeft, .topRight])
            
            HStack {
                Image(systemName: "clock")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(8)
                    .background(.yellow)
                    .cornerRadius(5)
                Text("Perpanjang Masa Pinjaman")
                Spacer()
                Image(systemName: "arrow.right")
                    .font(.title3)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.size.width - 40)
            .background(.secondary.opacity(0.2))
            .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
            
            Spacer()
        }
        .navigationTitle("Details")
        .onAppear {
//            rentViewModel.addDurationToTimestamp(index: rentIndex)
        }
    }
}

struct LockerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LockerDetailView(rent: Rent.example)
            .environmentObject(RentViewModel())
    }
}
