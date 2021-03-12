//
//  CardView.swift
//  Slots
//
//  Created by Kamil Kozioł on 06/08/2020.
//  Copyright © 2020 Kamil Kozioł. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var color: Color
    @Binding var dot: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(color)
                .cornerRadius(15)
                .frame(width: 100,height: 100)
            if dot {
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 25,height: 25)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(color: Binding.constant(Color.red), dot: Binding.constant(true))
    }
}
