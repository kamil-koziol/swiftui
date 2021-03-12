//
//  KretView.swift
//  Krety
//
//  Created by Kamil Kozioł on 12/03/2021.
//

import SwiftUI

struct KretView: View {
    
    @Binding var hasKret: Bool;
    
    var action: (() -> Void)?
    
    var body: some View {
        Button(action: action ?? {}
        , label: {
            Rectangle()
                .fill(hasKret ? Color("Kret"): Color.black)
                .frame(width: 100, height: 100)
        })
    }
}

struct KretView_Previews: PreviewProvider {
    
    static var previews: some View {
        KretView(hasKret: Binding.constant(false))
        KretView(hasKret: Binding.constant(true))
    }
}
