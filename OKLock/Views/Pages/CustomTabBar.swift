//
//  CustomTabBar.swift
//  SmartLocker
//
//  Created by Juliandy on 19/07/23.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: String
    @State var showScanPage: Bool = false
    @State var showLocationView = false
    
    var body: some View {
        NavigationView{
            
            VStack(spacing: 0) {
                Spacer()
                if selectedTab == "house.fill"{
                    HomePage()
                } else if selectedTab == "scroll.fill"{
                    Transaction()
                }
                
                HStack (spacing: -25){
                    
                    //Tab Bar Button
                    TabBarButton(image: "house.fill", selectedTab: $selectedTab)
                    
                    NavigationLink(destination: ScanQRView(), isActive: $showScanPage){
                        VStack{
                            Image(systemName: "qrcode.viewfinder")
                                .font(.system(size: 45))
                                .foregroundColor(Color(hex: "294356"))
                        }
                        .padding(18)
                        .background(Color(hex: "FFCC52"))
                        .clipShape(Circle())
                    }
                    .offset(y: -35)
                    .buttonStyle(PlainButtonStyle())
                    TabBarButton(image: "scroll.fill", selectedTab: $selectedTab)
                }
                .frame(height: 130)
                .padding(.vertical,-15)
                .background(
                    RoundedRectangle(cornerRadius: 45)
                        .foregroundColor(Color(hex: "294356"))
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -5))
            }.background(Color(hex: "E4E4E4"))
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabBarButton: View{
    var image: String
    @Binding var selectedTab: String
    
    var body: some View{
        Button(action: {
            selectedTab = image
        },label: {
            
            VStack(spacing: 8){
                
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30,height: 30)
                    .foregroundColor(selectedTab == image ? Color.white : Color(hex: "B8D5ED"))
            }
            .frame(maxWidth: .infinity)
        })
    }
}
