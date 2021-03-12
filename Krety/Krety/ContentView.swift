//
//  ContentView.swift
//  Krety
//
//  Created by Kamil Kozioł on 12/03/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var points: Int = 0
    @State private var czas: Int = 20
    @State private var krety: [[Bool]] = Array(repeating: Array(repeating: false, count: 3), count: 3)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func resetKrety() -> Void {
        for row in 0..<krety.count {
            for column in 0..<krety[row].count {
                krety[row][column] = false;
            }
        }
    }
    
    func randomizeKrety() -> Void {
        let row = Int.random(in: 0..<krety.count)
        let column = Int.random(in: 0..<krety.count)
        krety[row][column] = true;
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Punkty: \(points)")
                .font(.largeTitle)
                .padding()
            Text("Czas: \(czas)")
            Spacer()
            ForEach(0..<krety.count) { row in
                HStack {
                    Spacer()
                    ForEach(0..<krety.count) { column in
                        KretView(hasKret: $krety[row][column], action: {
                            points+=1
                            krety[row][column] = false;
                        })
                        Spacer()
                    }
                }
                Spacer()
            }
        }.onReceive(timer, perform: { _ in
            resetKrety()
            let kretAmount = Int.random(in: 1...3)
            for _ in 0..<kretAmount {
                randomizeKrety()
            }
            
            czas -= 1
            if czas == 0 {
                resetKrety()
                timer.upstream.connect().cancel()
            }
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
