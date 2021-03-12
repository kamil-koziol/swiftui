//
//  SliderView.swift
//  ColorPicker
//
//  Created by Kamil Kozioł on 06/08/2020.
//  Copyright © 2020 Kamil Kozioł. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double

    var color: Color
    var label: String = ""
    
    var body: some View {
        VStack {
            Slider(value: Binding(
                    get: {
                        self.value
                    },
                    set: {(newValue) in
                        self.value = newValue
                        let generator = UISelectionFeedbackGenerator()
                        generator.prepare()
                        generator.selectionChanged()
                    }
            ), in: 0...255, step: 1)
                .accentColor(color)
            Text("\(label): \(Int(value))")
                .foregroundColor(.white)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(
            value: Binding.constant(128),
            color: Color.red,
            label: "Red"
        )
    }
}
