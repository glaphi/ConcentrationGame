//
//  ConcentractionViewController.swift
//  ConcentrationGame
//
//  Created by Glaphi on 12/04/2018.
//  Copyright © 2018 Glaphi. All rights reserved.
//

import UIKit

class ConcentractionViewController: UIViewController {
    
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: cardButtons.count / 2)
    
    private var flipCount: Int = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let index = cardButtons.index(of: sender) {
            game.choseCard(at: index)
            updateViewFromModel()
        }
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0.9921568627, green: 0.4980392157, blue: 0.4862745098, alpha: 1)
            }
        }
    }
    
    private var emojiChoices: [String] = ["🚙","🌸","🍇","🐥","🐒", "☘️", "🌚", "🌥"]
    private var emoji = [Int: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.id] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.id] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.id] ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

