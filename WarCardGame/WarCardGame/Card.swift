//
//  Card.swift
//  WarCardGame
//
//  Created by Kamil Kozioł on 27/02/2021.
//

import Foundation

struct Card {
    
    var value: Int
    var imageName: String
    
    init(value: Int) {
        self.value = value;
        self.imageName = "card" + String(value)
    }
    
    static func random() -> Card {
        return Card(value: Int.random(in: 2...14))
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.value == rhs.value
    }
    
    static func < (lhs: Card, rhs: Card) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func > (lhs: Card, rhs: Card) -> Bool {
        return lhs.value > rhs.value
    }
    
    
}
