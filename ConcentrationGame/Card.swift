//
//  Card.swift
//  ConcentrationGame
//
//  Created by Glaphi on 12/04/2018.
//  Copyright © 2018 Glaphi. All rights reserved.
//

import Foundation

struct Card {
    
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    var id: Int
    
    static var idFactory: Int = 0
    
    static func uniqueId() -> Int {
        Card.idFactory += 1
        return Card.idFactory
    }
    
    init() {
        self.id = Card.uniqueId()
    }
}
