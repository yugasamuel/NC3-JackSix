//
//  ScanQRView.swift
//  SmartLocker
//
//  Created by Juliandy on 19/07/23.
//

import SwiftUI
import AVFoundation
import CryptoKit

struct ScanQRView: View {
    @EnvironmentObject var rentViewModel: RentViewModel
    @State private var encryptedData: String = ""
    @State private var key: SymmetricKey?
    @State private var isShowingScanner = true
    private let keyString = "kuncikebenaran"
    
    var body: some View {
        ZStack{
            if isShowingScanner {
                //Change with Your Scan QR Code here
                QRScannerView(scannedCode: $rentViewModel.scannedCode, isShowingScanner: $isShowingScanner)
                //Decoration Overlay
                VStack(alignment: .center){
                    Spacer()
                    Text("Scan kode QR untuk meminjam loker")
                        .foregroundColor(Color.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.all)
                        .frame(width: 280)
                        .multilineTextAlignment(.center)
                        .background(Color.black.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                    Image("QR Scan")
                    Spacer()
                    Text("Kode QR dapat dilihat di mesin OkLock")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .padding(.all)
                        .frame(width: 200)
                        .multilineTextAlignment(.center)
                        .background(Color.black.opacity(0.8))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                }
            } else {
                QRSuccessState()
            }
        }
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
    
    func decrypt() -> String? {
        do {
            guard let code = rentViewModel.scannedCode else {
                return nil
            }
            
            let key = try generateSymmetricKey(fromString: keyString)
            
            // Panggil fungsi dekripsi
            let decryptedData = try decryptData(sealedBoxBaseString: code, key: key)
            
            print("Decrypted Data: \(decryptedData)")
            print(type(of: key))
            return decryptedData
        } catch {
            print("Error: \(error)")
            return nil
        }
    }
}

struct ScanQRView_Previews: PreviewProvider {
    static var previews: some View {
        ScanQRView()
            .environmentObject(RentViewModel())
    }
}

