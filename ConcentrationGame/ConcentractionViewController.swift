//
//  ConcentractionViewController.swift
//  ConcentrationGame
//
//  Created by Glaphi on 12/04/2018.
//  Copyright © 2018 Glaphi. All rights reserved.
//

import UIKit

class ConcentractionViewController: UIViewController {
    
    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount: Int = 0 {
        didSet { updateFlipCountLabel() }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel! {
        didSet { updateFlipCountLabel() }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let index = cardButtons.index(of: sender) {
            game.choseCard(at: index)
            updateViewFromModel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            NSAttributedStringKey.strokeWidth : 5.0,
            NSAttributedStringKey.strokeColor : #colorLiteral(red: 0.9921568627, green: 0.4980392157, blue: 0.4862745098, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
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
    
    private var emojiChoices: String = "🚙🌸🍇🐥🐒☘️🌚🌥"
    
    private var emoji: [Card: String] = [:]
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let rndIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: rndIndex))
        }
        return emoji[card] ?? "?"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

