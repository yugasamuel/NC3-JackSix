//
//  DetailView.swift
//  SmartLocker
//
//  Created by Juliandy on 21/07/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            // Dismiss the LocationView when back button is pressed
        }, label: {
            Image(systemName: "chevron.left") // Use the system image for Back chevron
                .foregroundColor(.black) // You can change the color as needed
        })
    }
    
    @Binding var stationName: [String]
    @Binding var stationStatus: [String]
    @Binding var selectedIndex: Int
    @Binding var stationImage: [String]
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: "E4E4E4")
                GeometryReader{geometry in
                    VStack(alignment: .center) {
                        Text(stationName[selectedIndex])
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding()
                        //                Text(stationStatus[selectedIndex])
                        Image("\(stationImage[selectedIndex])")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .frame(width: 300,height: 230)
                            .padding(.bottom,20)
                        //                    HStack{
                        //                        Text("KETERSEDIAAN LOKER")
                        //                    Spacer()
                        //                    }
                        //                    .padding(.horizontal,geometry.size.width/10)
                        HStack{
                            Text("KETERSEDIAAN LOKER")
                            Spacer()
                        }
                        .padding(.horizontal,geometry.size.width/10)
                        VStack{
                            HStack(spacing: 5){
                                Text("M")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(hex: "294356"))
                                    .frame(width: 15, height: 15)
                                    .padding(15)
                                    .background(Color(hex: "F2C760"))
                                    .clipShape(RoundedRectangle(cornerRadius: 7))
                                Text("Sedang")
                                Spacer()
                                Text("5")
                            }
                            .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                            Divider()
                                .padding(.horizontal)
                            HStack(spacing: 5){
                                Text("L")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(hex: "294356"))
                                    .frame(width: 15, height: 15)
                                    .padding(15)
                                    .background(Color(hex: "F2C760"))
                                    .clipShape(RoundedRectangle(cornerRadius: 7))
                                Text("Besar")
                                Spacer()
                                Text("10")
                            }
                            .padding(EdgeInsets(top: 5, leading: 15, bottom: 10, trailing: 15))
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.top,80)
                    .frame(width: geometry.size.width, height: .infinity)
                }
                .navigationBarTitle("Detail", displayMode: .inline)
                .navigationBarItems(leading: backButton)
            }
            .ignoresSafeArea()
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
