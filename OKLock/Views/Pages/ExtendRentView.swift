//
//  ExtendRentView.swift
//  OKLock
//
//  Created by Yuga Samuel on 23/07/23.
//

import SwiftUI

struct ExtendRentView: View {
    @State private var duration = 0
    @State private var size = ""
    let durationList = Array(0...48)
    let sizeList = ["Ukuran", "Kecil", "Sedang" ,"Besar"]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Durasi")
                    .padding(.leading)
                Spacer()
                Picker("Durasi", selection: $duration) {
                    ForEach(durationList, id: \.self) { duration in
                        Text("\(duration) Jam")
                    }
                }
            }
            .padding(5)
            .frame(width: UIScreen.main.bounds.size.width - 40)
            .background(.secondary.opacity(0.2))
            .cornerRadius(8, corners: [.topLeft, .topRight])
            .padding(.top, 30)
            
            HStack {
                Text("Ukuran")
                    .padding(.leading)
                Spacer()
                Picker("Size", selection: $size) {
                    ForEach(sizeList, id: \.self) { size in
                        Text(size)
                    }
                }
            }
            .padding(5)
            .frame(width: UIScreen.main.bounds.size.width - 40)
            .background(.secondary.opacity(0.2))
            .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
            
            HStack(spacing: 0) {
                Spacer()
                Text("Total: ")
                Text("Rp\(duration*1000)")
                    .fontWeight(.bold)
            }
            .frame(width: UIScreen.main.bounds.size.width - 40)
            .padding()
            
            HStack {
                Text("Pembayaran")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width - 40)
            .padding(10)
            
            HStack(spacing: 5) {
                Image(systemName: "creditcard")
                    .font(.title2)
                Text("Durasi")
                    .padding(.leading)
                Spacer()
                Text("Rp\(100000)")
                    .fontWeight(.bold)
            }
            .padding()
            .frame(width: UIScreen.main.bounds.size.width - 40)
            .background(.secondary.opacity(0.2))
            .cornerRadius(8)
            
            VStack {
                Button(action: {
                    
                }, label: {
                    Text("Bayar Sekarang")
                        .padding(12)
                        .frame(width: UIScreen.main.bounds.size.width - 40)
                        .foregroundColor(.black)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .background(.yellow)
                        .cornerRadius(8)
                        .shadow(radius: 2, y: 2)
                })
                .padding(.top, 50)
                
                Text("Setelah pembayaran berlangsung maka durasi peminjaman akan bertambah dan saldo akan terpotong")
                    .font(.caption)
                    .frame(width: UIScreen.main.bounds.size.width - 40)
                    .padding(5)
            }
            
            Spacer()
        }
        .navigationTitle("Perpanjang Masa Pinjaman")
    }
}

struct ExtendRentView_Previews: PreviewProvider {
    static var previews: some View {
        ExtendRentView()
    }
}
