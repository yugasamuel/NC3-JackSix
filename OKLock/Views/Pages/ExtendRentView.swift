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
    @State var money: Int = 100000
    let durationList = Array(0...48)
    let sizeList = ["Ukuran", "Kecil", "Sedang" ,"Besar"]
    @State private var popUpView = false
    
    var body: some View {
        ZStack{
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
                        popUpView.toggle()
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
            
            // Pop-up view
                        if popUpView {
                            Color.black.opacity(0.5) // Semi-transparent black background
                                .ignoresSafeArea()
                            
                            VStack{
                                Spacer()
                                Text("Berhasil!")
                                    .font(.system(size: 40))
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60,height: 60)
                                Spacer()
                                HStack{
                                    Spacer()
                                    Text("Durasi loker anda sudah ditambahkan dan aktif")
                                        .font(.body)
                                        .frame(width: 195)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                Spacer()
                                Button(action: {
                                    popUpView.toggle()
                                }, label: {
                                    Text("OK")
                                        .padding(EdgeInsets(top: 12, leading: 100, bottom: 12, trailing: 100))
                                        .foregroundColor(.black)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .background(.yellow)
                                        .cornerRadius(8)
                                        .shadow(radius: 2, y: 2)
                                })
                                Spacer()
                            }
                            .background(Color(hex:"EFEFEF"))
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.all)
                            .frame(width: 298, height: 364)
                            
                        }
        }
    }
}

struct ExtendRentView_Previews: PreviewProvider {
    static var previews: some View {
        ExtendRentView()
    }
}
