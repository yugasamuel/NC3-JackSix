//
//  Transaction.swift
//  SmartLocker
//
//  Created by Juliandy on 19/07/23.
//

import SwiftUI

struct Transaction: View {
    @State private var selectedTab = 1
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color(hex: "FFCC52"))
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(Color(hex: "1A3244"))], for: .normal)
    }
    
    var body: some View {
        NavigationView{
            GeometryReader{geometry in
                VStack{
                    Picker(selection: $selectedTab, label: Text("Pages")) {
                        Text("Aktif").tag(0)
                        Text("Riwayat").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.all)
                    Spacer()
                    if selectedTab == 0 {
                        ActiveView()
                    } else {
                        HistoryView()
                    }
                    Spacer()
                }
                
            }
            .background(Color(hex: "E4E4E4"))
        }
    }
}

struct Transaction_Previews: PreviewProvider {
    static var previews: some View {
        Transaction()
    }
}


struct ActiveView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: "E4E4E4")
                GeometryReader{geometry in
                    ScrollView{
                        VStack{
                            HStack{
                                Text("Loker 14A")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Text("Selasa, 18 Juli 2023")
                                    .font(.subheadline)
                            }
                            HStack{
                                Text("(01:34:27)")
                                    .font(.subheadline)
                                Spacer()
                            }
                            HStack{
                                Image(systemName: "mappin")
                                Text("Stasiun Lebak Bulus Grab")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                                Spacer()
                                Text("Aktif")
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 3, leading: 15, bottom: 3, trailing: 15))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .background(Color(hex: "579837"))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                            HStack{
                                Spacer()
                                Button(action: {}, label: {
                                    Text("Detail")
                                        .font(.system(size: 14))
                                })
                                .foregroundColor(Color(hex: "193346"))
                                .padding(.horizontal,15)
                                .padding(.vertical,3)
                                .background(Color(hex: "ABC9E1"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: .infinity, height: 10)
                                .padding(.horizontal,26)
                                Spacer()
                            }
                        }
                        .padding(.all)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: geometry.size.width - 50)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        .shadow(color: Color.black.opacity(0.2),radius: 2,y: 3)
                    }
                    .frame(width: geometry.size.width, height: .infinity)
                }
            }
            
        }
    }
}

struct HistoryView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: "E4E4E4")
                GeometryReader{geometry in
                    ScrollView{
                        VStack(spacing: 4){
                            HStack{
                                Text("Loker 14A")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                                Text("Selasa, 18 Juli 2023")
                                    .font(.subheadline)
                            }
                            HStack{
                                Image(systemName: "mappin")
                                Text("Stasiun Lebak Bulus Grab")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                                Spacer()
                            }
                            
                            HStack{
                                Spacer()
                                Button(action: {}, label: {
                                    Text("Detail")
                                        .font(.system(size: 14))
                                })
                                .foregroundColor(Color(hex: "193346"))
                                .padding(.horizontal,15)
                                .padding(.vertical,3)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: .infinity, height: 10)
                                .padding(.horizontal,26)
                                Spacer()
                            }
                            .padding(.top,10)
                        }
                        .foregroundColor(Color.white)
                        .padding(.all)
                        .background(Color(hex: "AEAEAE"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: geometry.size.width - 50)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        .shadow(color: Color.black.opacity(0.2),radius: 2,y: 3)
                    }
                    .frame(width: geometry.size.width, height: .infinity)
                }
            }
            
        }
    }
}
