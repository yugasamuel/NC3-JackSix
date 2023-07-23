//
//  HomePage.swift
//  SmartLocker
//
//  Created by Juliandy on 19/07/23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
}

struct HomePage: View {
    @State private var time: String = "Siang"
    @State private var money: Int = 100000
//    @State private var showInfo = false
    @State private var titleOffset: CGFloat = 0
    
    @State var stationNumber: Int = 4
    @State var stationName = ["Stasiun Lebak Bulus Grab","Stasiun Blok M BCA","Stasiun Bundaran HI","Stasiun Dukus Atas BNI"]
    @State var stationStatus = ["15 Slot Tersedia","10 Slot Tersedia","5 Slot Tersedia","Slot Penuh"]
    @State var statusColor = ["579837","E29A12","E29A12","B82A20"]
    @State var stationImage = ["Lebak Bulus","Blok M","Bundaran HI","Dukuh Atas"]
    
    
    var body: some View {
        NavigationView{
            GeometryReader { geometry in
                ScrollView{
                    VStack(spacing: 10){
                        Text("Selamat \(time)") // Replace this with your own title
                            .font(.system(size: 30))
                            .fontWeight(.semibold)
                            .frame(width: geometry.size.width - 50, alignment: .leading)
                            .offset(x: self.titleOffset < 0 ? -self.titleOffset : 0, y: 0)
                            .onAppear {
                                let offset = geometry.size.width - geometry.frame(in: .global).width
                                self.titleOffset = offset > 0 ? offset : 0
                            }
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 15, trailing: 0))
                        // E-Wallet Card
                        VStack(spacing:5){
                            HStack{
                                Text("Saldo")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                Spacer()
                            }
                            
                            HStack{
                                Text("Rp")
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                                Text("\(money)")
                                    .font(.title)
                                    .fontWeight(.bold)
                            }
                            .padding(.bottom)
                            
                            HStack(spacing: 10){
                                VStack(spacing: 5){
                                    Image(systemName: "plus")
                                    Text("Top Up")
                                        .font(.caption)
                                }
                                .frame(width: 50,height: 50)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                VStack(spacing: 5){
                                    Image(systemName: "arrow.up.square")
                                    Text("Pay")
                                        .font(.caption)
                                }
                                .frame(width: 50,height: 50)
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                Spacer()
                            }
                        }
                        .padding(.all)
                        .background(Color(hex: "ABC9E1"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: geometry.size.width - 50)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        .shadow(color: Color.black.opacity(0.2),radius: 2,y: 3)
                        
                        
                        // Active Locker Card
                        VStack(alignment: .leading, spacing: 5){
                            HStack(alignment: .top){
                                VStack(alignment: .leading, spacing: -3){
                                    Text("Peminjaman Loker")
                                    Text("14A")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                                Text("Aktif")
                                    .foregroundColor(Color.white)
                                    .padding(EdgeInsets(top: 7, leading: 30, bottom: 7, trailing: 30))
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .background(Color(hex: "579837"))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                            }
                            
                            HStack(alignment: .bottom, spacing: 5){
                                VStack(alignment: .leading, spacing: -3){
                                    Text("Aktif Hingga")
                                    Text("18:00")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.trailing)
                                    Text("(01:23:46)")
                                        .font(.system(size: 16))
                                        .fontWeight(.medium)
                                        .multilineTextAlignment(.trailing)
                                }
                                Spacer()
                                
                                Text("Stasiun Lebak Bulus Grab")
                                    .font(.system(size: 15))
                                    .fontWeight(.light)
                                Image(systemName: "mappin")
                            }
                            
                        }
                        .padding(.all)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: geometry.size.width - 50)
                        .shadow(color: Color.black.opacity(0.2),radius: 2,y: 3)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        
                        // Station Info Card
                        HStack(alignment: .center){
                            Text("OkLok di Sekitar")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                            Spacer()
                            
                            //SEE MORE BUTTON
//                            Button(action: {
//                                showInfo.toggle()
//                            }){Text("see more")
//                                    .font(.system(size: 15))
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(Color.blue)
//                            }
                        }
                        .padding(.horizontal) // Add left padding to move the text to the left
                        .frame(width: geometry.size.width - 15, alignment: .leading) // Align text to the left
                        .foregroundColor(.black) // Set text color
                        .font(.headline) // Set font style for the text
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                RectangleCard(numberOfCards: stationNumber, stationName: stationName, stationStatus: stationStatus, statusColor: statusColor, stationImage: stationImage)
                            }
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))
                        }
                        .frame(width: geometry.size.width, alignment: .leading)
                        
                    }
                    .foregroundColor(Color(hex: "294356"))
                    .padding(.top,20)
                    .padding(.bottom,30)
                }
                
                .frame(width: geometry.size.width, height: .infinity)
//                .padding(.bottom,30)
                // Set ScrollView frame to screen size
                
                .background(Color(hex: "E4E4E4"))
                
                //LocationView Trigger
//                .fullScreenCover(isPresented: $showInfo) {
//                    LocationView(stationNumber: $stationNumber, stationName: $stationName, stationStatus: $stationStatus, statusColor: $statusColor)
//                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct RectangleCard: View {
    var numberOfCards: Int
    @State var stationName: [String]
    @State var stationStatus: [String]
    @State var statusColor: [String]
    @State private var selectedIndex: Int = 0
    @State var stationImage: [String]
    
    @State private var isDetailViewPresented = false
    
    var body: some View {
        ForEach(0..<numberOfCards, id: \.self) { index in
            VStack(alignment: .leading, spacing: 5){
                
                // Subs with Image
                Image("\(stationImage[index])")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .frame(width: 120,height: 80)
                Text("\(stationName[index])")
                    .font(.headline)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    Image(systemName: "archivebox.fill")
                    Text("\(stationStatus[index])")
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 13, trailing: 0))
                .foregroundColor(Color(hex:statusColor[index]))
                .font(.caption)
                Button(action: {
                    isDetailViewPresented.toggle()
                    selectedIndex = index
                }, label: {
                        Text("Detail")
                        .font(.system(size: 14))
                    })
                .padding(.horizontal,15)
                .padding(.vertical,3)
                .background(Color(hex: "E4E4E4"))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: .infinity, height: 10)
                .padding(.horizontal,26)
                .fullScreenCover(isPresented: $isDetailViewPresented){
                    DetailView(
                        stationName: $stationName, stationStatus: $stationStatus, selectedIndex: $selectedIndex, stationImage: $stationImage)
                }
                
                
                //TEXT
            }
            .padding(EdgeInsets(top: 3, leading: 10, bottom: 15, trailing: 10))
            .frame(width: 140, height: 220)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: Color.black.opacity(0.1),radius: 5,y: 5)
        }
    }
}



