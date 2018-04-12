//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Glaphi on 12/04/2018.
//  Copyright © 2018 Glaphi. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards: [Card] = []
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func choseCard(at index: Int) {
        if !cards[index].isMatched {
            // matching with the only face up card
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].id == cards[index].id {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // no cars or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
        
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card: Card = Card()
            
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}
