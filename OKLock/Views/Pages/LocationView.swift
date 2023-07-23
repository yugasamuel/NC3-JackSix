//
//  LocationView.swift
//  SmartLocker
//
//  Created by Juliandy on 20/07/23.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var stationNumber: Int
    @Binding var stationName: [String]
    @Binding var stationStatus: [String]
    @Binding var statusColor: [String]
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            // Dismiss the LocationView when back button is pressed
        }, label: {
            Image(systemName: "chevron.left") // Use the system image for Back chevron
                .foregroundColor(.black) // You can change the color as needed
        })
    }
    var body: some View {
        NavigationView{
            GeometryReader{ geometry in
                ScrollView{
                    VStack(spacing:1){
                        StationCard(numberOfCards: stationNumber, cardTitles: stationName, stationStatus: stationStatus, statusColor: statusColor)
                    }
                }
            }
            .navigationBarTitle("Ok Lok di Sekitar", displayMode: .inline)
            .navigationBarItems(leading: backButton)
            
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        StationCard(numberOfCards: 5, cardTitles: ["Fatmawati", "Blok M", "Dukuh Atas", "Lebak Bulus", "ASEAN"])

        
    }
}


struct StationCard: View {
    var numberOfCards: Int
    var cardTitles: [String]
    var stationStatus: [String]
    var statusColor: [String]
    
    var body: some View {
        ForEach(0..<numberOfCards, id: \.self) { index in
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: .infinity, height: 120)
                //                .shadow(radius: 5)
                    .shadow(color: Color.black.opacity(0.2),radius: 2,x: 4,y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black.opacity(0.3), lineWidth: 1))
                    
                
                HStack(alignment: .top, spacing:10){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange)
                        .frame(width: 120,alignment: .leading)
                    VStack(spacing: 30){
                        HStack{
                            Text(cardTitles[index])
                            Spacer()
                        }
                        
                        HStack(spacing: 10){
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                            Text(stationStatus[index])
                        }
                        .foregroundColor(Color(hex: "\(statusColor[index])"))
                        
                    }
                    .frame(width: .infinity, height: 90, alignment: .leading)
                    
                    Spacer()
                }
                .padding(.vertical,15)
                .frame(maxWidth: .infinity, maxHeight: 120)
                .padding(.horizontal)
                
                //                HStack(spacing: 20){
                //                    RoundedRectangle(cornerRadius: 10)
                //                        .fill(Color.orange)
                //                        .frame(width: 120, height: 90, alignment: .leading)
                //                    VStack{
                //                        Text("Stasiun "+cardTitles[index])
                //                            .padding(.top)
                //                            .padding(.trailing)
                //                        Spacer()
                //                        Text("2/10")
                //                            .padding(.leading)
                //                            .padding(.bottom)
                //                    }
                //                }
                //                .frame(width: .infinity, height: 120, alignment: .leading)
            }
            .padding(.top,20)
            .padding(.horizontal)
        }
    }
    
}
