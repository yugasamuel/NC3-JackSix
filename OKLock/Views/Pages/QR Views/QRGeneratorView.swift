//
//  QRGeneratorView.swift
//  OKLock
//
//  Created by Indah Rahmawati on 18/07/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins
import CryptoKit

struct QRGeneratorView: View {
    @State private var textInput: String = ""
    @State private var generatedQRCode: UIImage?
    @State private var encryptedData: String = ""
    private let keyString = "kuncikebenaran"
    @State private var key: SymmetricKey?
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $textInput)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: generateQRCode) {
                Text("Generate Encrypted QRCode")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: generateUUIDCode) {
                Text("Generate UUID Code")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if let qrCodeImage = generatedQRCode {
                Image(uiImage: qrCodeImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .padding()
    }
    
   
    func generateUUIDCode(){
        guard !textInput.isEmpty else {
            return
        }
//        let data = Data(textInput.utf8)
        
        do {
            key = try generateSymmetricKey(fromString: keyString)
            encryptedData = try encryptData(stringMessage: UUID().uuidString, key: key!)
            print("Encrypted Data: \(encryptedData)")

        } catch {
            print("Error: \(error)")
        }
        let data = Data(encryptedData.utf8)
        
        print(type(of: data))
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            if let ciImage = filter.outputImage {
                let context = CIContext()
                if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
                    let uiImage = UIImage(cgImage: cgImage)
                    generatedQRCode = uiImage
                }
            }
        }
    }
    
    
    func generateQRCode() {
        guard !textInput.isEmpty else {
            return
        }
//        let data = Data(textInput.utf8)
        
        do {
            key = try generateSymmetricKey(fromString: keyString)
            encryptedData = try encryptData(stringMessage: textInput, key: key!)
            print("Encrypted Data: \(encryptedData)")

        } catch {
            print("Error: \(error)")
        }
        let data = Data(encryptedData.utf8)
        
        print(type(of: data))
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            if let ciImage = filter.outputImage {
                let context = CIContext()
                if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
                    let uiImage = UIImage(cgImage: cgImage)
                    generatedQRCode = uiImage
                }
            }
        }
    }
    
//    func generateQRCode() {
//        guard !textInput.isEmpty else {
//            return
//        }
//
//
//
//
//        let data = Data(textInput.utf8)
//
//
//
//
//        if let filter = CIFilter(name: "CIQRCodeGenerator") {
//            filter.setValue(data, forKey: "inputMessage")
//            if let ciImage = filter.outputImage {
//                let context = CIContext()
//                if let cgImage = context.createCGImage(ciImage, from: ciImage.extent) {
//                    let uiImage = UIImage(cgImage: cgImage)
//                    generatedQRCode = uiImage
//                }
//            }
//        }
//    }
}

struct QRGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        QRGeneratorView()
    }
}

