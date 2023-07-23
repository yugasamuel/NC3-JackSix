//
//  ContentView.swift
//  SmartLocker
//
//  Created by Juliandy on 19/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab: String = "house.fill"
    var body: some View {
        VStack(spacing: 0){
//            Spacer()
//                if selectedTab == "house.fill"{
//                    HomePage()
//                } else if selectedTab == "scroll.fill"{
//                    Transaction()
//                }
                //Custom Tab Button
                CustomTabBar(selectedTab: $selectedTab)
        }

        .edgesIgnoringSafeArea(.bottom)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
