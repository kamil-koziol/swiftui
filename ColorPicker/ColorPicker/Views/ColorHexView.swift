//
//  ColorHexView.swift
//  ColorPicker
//
//  Created by Kamil Kozioł on 06/08/2020.
//  Copyright © 2020 Kamil Kozioł. All rights reserved.
//

import SwiftUI
import MobileCoreServices

struct ColorHexView: View {
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    
    var body: some View {
        Text(String(format:"#%02X%02X%02X", Int(red), Int(green), Int(blue)))
            .onLongPressGesture {
                // CLIPBOARD
                let pasteBoard = UIPasteboard.general
                pasteBoard.string = String(format:"#%02X%02X%02X", Int(self.red), Int(self.green), Int(self.blue))
                // HAPTICS
                
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.impactOccurred()
        }
        .foregroundColor(.white)
    }
}

struct ColorHexView_Previews: PreviewProvider {
    static var previews: some View {
        ColorHexView(red: Binding.constant(0), green: Binding.constant(0), blue: Binding.constant(0)).background(Color.black)
    }
}
