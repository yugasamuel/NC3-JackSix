//
//  ScannerController.swift
//  MRTLocker
//
//  Created by Jason Leonardo on 13/07/23.
//

import Foundation
import SwiftUI
import AVFoundation

class ScannerViewController: UIViewController {
    var delegate: QRScannerView.Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to get the camera device")
            return
        }
        
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {
            print("Failed to create input device")
            return
        }
        
        let captureSession = AVCaptureSession()
        captureSession.addInput(input)
        
        let metadataOutput = AVCaptureMetadataOutput()
        captureSession.addOutput(metadataOutput)
        
        metadataOutput.setMetadataObjectsDelegate(delegate, queue: DispatchQueue.main)
        metadataOutput.metadataObjectTypes = [.qr]
        
        let videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer)
        
        captureSession.startRunning()
    }
}
