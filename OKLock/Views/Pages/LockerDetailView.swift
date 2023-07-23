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
    @State var extendTime = false
    @State var endTime = false

    //    var rentIndex: Int {
    //        rentViewModel.rentList.firstIndex(where: { $0.id == rent.id }) ?? 0
    //    }
    
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Text("Loker 14A")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 25)
                
                HStack {
                    Image(systemName: "mappin")
                        .font(.title3)
                    Text(rent.location)
                        .font(.title3)
                }
                
                QRGeneratorView()
                    .padding(.vertical, 25)
                
                Text("Aktif hingga \(rent.formattedTimestamp)")
                    .font(.title3)
                    .padding(.bottom, 50)
                Button(action: {
                    extendTime.toggle()
                }){
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
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: UIScreen.main.bounds.size.width - 40)
                    .background(.secondary.opacity(0.2))
                    .cornerRadius(8, corners: [.topLeft, .topRight])
                }
                Button(action: {
                    endTime.toggle()
                }){
                    HStack {
                        Image(systemName: "multiply")
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding(8)
                            .background(.yellow)
                            .cornerRadius(5)
                        Text("Akhiri Masa Pinjaman")
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.title3)
                    }
                    .foregroundColor(Color.black)
                    .padding()
                    .frame(width: UIScreen.main.bounds.size.width - 40)
                    .background(.secondary.opacity(0.2))
                    .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color(hex: "E4E4E4"))
            .navigationTitle("Details")
            .onAppear {
                //            rentViewModel.addDurationToTimestamp(index: rentIndex)
            }
            // Pop-up view
            if extendTime {
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
                        extendTime.toggle()
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
                
            } else if endTime {
                Color.black.opacity(0.5) // Semi-transparent black background
                    .ignoresSafeArea()
                
                VStack(alignment: .leading){
                    Spacer()
                    HStack{
                        Spacer()
                        Image(systemName: "exclamationmark.bubble.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60,height: 60)
                        Spacer()
                    }
                    Text("Akhiri Masa Peminjaman?")
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    Text("Pastikan barang anda sudah diambil dan loker dalam keadaan kosong dan terkunci")
                        .font(.caption)
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Button(action: {
                        endTime.toggle()
                    }, label: {
                        Text("Tidak Sekarang")
                            .padding(.vertical,12)
                            .padding(.horizontal,39)
                            .foregroundColor(.black)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .background(.yellow)
                            .cornerRadius(8)
                            .shadow(radius: 2, y: 2)
                            
                    })
                    Button(action: {
                        endTime.toggle()
                    }, label: {
                        Text("Iya, akhiri sekarang")
                            .padding(EdgeInsets(top: 12, leading: 21, bottom: 12, trailing: 21))
                            .foregroundColor(.black)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .background(Color(hex: "ECECEC"))
                            .cornerRadius(8)
                            .shadow(radius: 2, y: 2)
                            
                    })
                }
                .padding(.all)
                .background(Color(hex:"EFEFEF"))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.all)
                .frame(width: 298, height: 364)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LockerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LockerDetailView(rent: Rent.example)
            .environmentObject(RentViewModel())
    }
}
