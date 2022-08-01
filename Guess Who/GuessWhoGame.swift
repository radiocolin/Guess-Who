//
//  GuessWhoGame.swift
//  Guess Who
//
//  Created by Colin Weir on 6/23/22.
//

import Foundation
import UIKit

class Game {
    var player = Player()
    var gameCards = getUniqueCards(16)
    var perCardBonus = 10
    var wrongQuestionPenalty = 5
    
    static func getUniqueCards(_ numberOfCards: Int) -> [Card] {
        var result = [Card]()
        var unique = Set<Int>()
        while unique.count < numberOfCards {
            unique.insert(Int.random(in: 1..<52))
        }
        for number in unique {
            result.append(availableCards["image-\(number)"]!)
        }
        return result
    }
    
    func pickWinningCard() {
        for card in gameCards {
            card.winner = false
        }
        gameCards.randomElement()?.winner = true
    }
}

class Card {
    let image: UIImage?
    let gender: String
    let noseSize: String
    let eyeColor: String
    let hairColor: String
    let glasses: Bool
    var winner = false
    
    init(image: UIImage?, gender: String, noseSize: String, eyes: String, hair: String, glasses: Bool){
        self.image = image
        self.gender = gender
        self.noseSize = noseSize
        self.eyeColor = eyes
        self.hairColor = hair
        self.glasses = glasses
    }
}

class Player {
    var score = 0
}
