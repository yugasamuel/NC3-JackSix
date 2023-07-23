//
//  QRSuccessState.swift
//  OKLock
//
//  Created by Yuga Samuel on 23/07/23.
//

import SwiftUI

struct QRSuccessState: View {
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.black)
                .opacity(0.75)
            VStack(spacing: 20) {
                Text("Berhasil!")
                    .font(.title)
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                Text("Loker telah berhasil disewa")
                    .font(.title3)
                Button(action: {
                    
                }, label: {
                    NavigationLink(destination: ContentView(), label: {
                        Text("OK")
                            .font(.title2.bold())
                            .padding()
                            .foregroundColor(.black)
                            .frame(width: 280)
                            .background(.yellow)
                            .cornerRadius(8)
                            .shadow(radius: 3, y: 3)
                    })
                })
            }
            .padding()
            .padding()
            .background(.white)
            .cornerRadius(8)
        }
        .foregroundColor(.black)
    }
}

struct QRSuccessState_Previews: PreviewProvider {
    static var previews: some View {
        QRSuccessState()
    }
}
