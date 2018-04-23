//
//  Concentration.swift
//  ConcentrationGame
//
//  Created by Glaphi on 12/04/2018.
//  Copyright © 2018 Glaphi. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards: [Card] = []
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter{cards[$0].isFaceUp}.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func choseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in cards")
        if !cards[index].isMatched {
            // matching with the only face up card
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {
                // no cars or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)) : number of pairs must be greater than 0")
        for _ in 0..<numberOfPairsOfCards {
            let card: Card = Card()
            cards.append(card)
            cards.append(card)
        }
        // TODO: Shuffle the cards
    }
}
