//
//  QRCodeView.swift
//  Hach2023_new
//
//  Created by Dosi Dimitrov on 16.09.23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    var url : String
    
    
    var body: some View {
        Image(uiImage: generateQRCodeImage(url))
            .interpolation(.none)
            .resizable()
            .frame(width: 150, height: 150)
    }
    func generateQRCodeImage(_ url : String) -> UIImage {
        
        let data = Data(url.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let qrCodeImage = filter.outputImage {
            if let qrCodeCGImage = context.createCGImage(qrCodeImage, from: qrCodeImage.extent) {
                return UIImage(cgImage: qrCodeCGImage)
            }
        }
        
        return UIImage(systemName: "xmark") ?? UIImage()
    }
}
