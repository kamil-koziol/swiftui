//
//  ContentView.swift
//  WarCardGame
//
//  Created by Kamil Kozioł on 27/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard: Card = Card.random()
    @State var cpuCard: Card = Card.random()
    
    @State var playerScore: Int = 0
    @State var cpuScore: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("War")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            HStack {
                Spacer()
                Image(playerCard.imageName)
                    .cornerRadius(10)
                
                Spacer()
                Image(cpuCard.imageName)
                    .cornerRadius(10)
                    
                Spacer()
            }
            
            Spacer()
            
            
            Button(action: {
                playerCard = Card.random()
                cpuCard = Card.random()
                
                if(playerCard > cpuCard) {
                    playerScore += 1
                } else if (playerCard == cpuCard){
                    cpuScore += 1
                    playerScore += 1
                } else {
                    cpuScore += 1
                }
                
            }, label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Deal")
                }.padding().background(Color.white).cornerRadius(5)
            })
            
            Spacer()
            
            HStack {
                Spacer()
                
                VStack(alignment: .center, spacing: 5.0) {
                    Text("Player")
                        .font(.title2)
                    Text(String(playerScore))
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 5.0) {
                    Text("CPU")
                        .font(.title2)
                    Text(String(cpuScore))
                }
                
                Spacer()
            }
            
            Spacer()
            
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
