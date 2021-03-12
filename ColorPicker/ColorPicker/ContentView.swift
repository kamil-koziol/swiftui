//
//  ContentView.swift
//  ColorPicker
//
//  Created by Kamil Kozioł on 06/08/2020.
//  Copyright © 2020 Kamil Kozioł. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var red: Double = 255
    @State var green: Double = 255
    @State var blue: Double = 255

    var body: some View {
        
        VStack {
            Spacer()
            VStack {
                SliderView(value: $red, color: .red, label: "Red")
                    .padding(.top, 50)
                    .padding(.horizontal, 75)
                SliderView(value: $green, color: .green, label: "Green")
                    .padding(.horizontal, 75)
                SliderView(value: $blue, color: .blue, label: "Blue")
                    .padding(.bottom, 30)
                    .padding(.horizontal, 75)
                
                
                ColorHexView(red: $red, green: $green, blue: $blue)
                    .padding()
            }
            .background(Color.black)
            .cornerRadius(50)
            .padding(.horizontal, 40)
            Spacer()
        }
        .padding()
        .background(Color(red: red/255, green: green/255, blue: blue/255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
