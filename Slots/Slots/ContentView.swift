//
//  ContentView.swift
//  Slots
//
//  Created by Kamil Kozioł on 06/08/2020.
//  Copyright © 2020 Kamil Kozioł. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var credits: Int = 100
    @State var colors: [Color] = [Color.red, Color.green, Color.blue]
    @State var dots: [Bool] = [Bool] (repeating: false, count: 9)
    @State var numbers: [Int] = [Int] (repeating: 0, count: 9)
    @State var won: Bool = false
    var combinations: [(Int, Int, Int)] = [(0,1,2), (3,4,5), (6,7,8), (0,4,8), (2,4,6)]
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                Spacer()
                
                if self.won {
                    HStack {
                        Text(String(credits))
                        Image(systemName: "dollarsign.circle")
                    }
                    .foregroundColor(.green)
                    .font(.title)
                }
                else {
                    HStack {
                        Text(String(credits))
                        Image(systemName: "dollarsign.circle")
                    }
                    .foregroundColor(.white)
                    .font(.title)
                }
                
                    
                
                Spacer()
                VStack {
                    HStack {
                        CardView(color: $colors[numbers[0]], dot: $dots[0])
                        CardView(color: $colors[numbers[1]], dot: $dots[1])
                        CardView(color: $colors[numbers[2]], dot: $dots[2])
                    }
                    HStack {
                        CardView(color: $colors[numbers[3]], dot: $dots[3])
                        CardView(color: $colors[numbers[4]], dot: $dots[4])
                        CardView(color: $colors[numbers[5]], dot: $dots[5])
                    }
                    HStack {
                        CardView(color: $colors[numbers[6]], dot: $dots[6])
                        CardView(color: $colors[numbers[7]], dot: $dots[7])
                        CardView(color: $colors[numbers[8]], dot: $dots[8])
                    }
                }
                
                Spacer()
                
                HStack {
                    Button(action: {self.spin(amount: 5, reward: 15)}) {
                        Text("SPIN")
                            .foregroundColor(.black)
                            .padding()
                            .padding(.horizontal, 50)
                            .background(Color.white)
                            .cornerRadius(30)
                    }
                    
                    Button(action: {self.spin(amount: 25, reward: 50)}) {
                        Text("SPIN 25")
                            .foregroundColor(.black)
                            .padding()
                            .padding(.horizontal, 50)
                            .background(Color.white)
                            .cornerRadius(30)
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func check(num1: Int, num2: Int, num3: Int) -> Bool
    {
        return self.numbers[num1] == self.numbers[num2] && self.numbers[num2] == self.numbers[num3]
    }
    
    func spin(amount: Int, reward: Int)
    {
        var multiply: Int = 0
        
        // RANDOMIZING
        for index in 0..<self.numbers.count {
            self.numbers[index] = Int.random(in: 0...2)
            self.dots[index] = false
        }
        
        self.credits -= amount
        
        // CHECKING IF WON
        
        self.won = false
        
        for combination in self.combinations {
            if self.check(num1: combination.0, num2: combination.1, num3: combination.2)
            {
                self.dots[combination.0] = true
                self.dots[combination.1] = true
                self.dots[combination.2] = true
                multiply += 1
                self.won = true
            }
        }
        
        self.credits += multiply*multiply*reward
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
