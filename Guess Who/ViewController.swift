//
//  ViewController.swift
//  Guess Who
//
//  Created by Colin Weir on 6/23/22.
//

import UIKit

class ViewController: UIViewController {

    var game = Game()
    var instructionsShown = false
    
    @IBOutlet weak var questionStack: UIStackView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var gridContainer: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpGame()
        updateCardGrid()
    }

    override func viewDidAppear(_ animated: Bool) {
        let howToPlay = """
        Guess the person the computer has chosen.
        
        Ask questions to eliminate possibilities. Ask the wrong question and face a penalty.
        
        Earn a bonus for every card remaining when you guess the chosen person.
        
        Tap a face to guess the chosen person... but be careful, you can only guess once!
        """
        
        if !instructionsShown {
            let alertController = UIAlertController(title: "How To Play", message: howToPlay, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            instructionsShown.toggle()
        }
    }
    
    func setUpGame() {
        game.pickWinningCard()
        var winner: Card { game.gameCards.filter { $0.winner == true }[0] }
        print(winner.eyeColor,winner.hairColor,winner.noseSize,winner.glasses)


        var possibleEyes: Set<String> {
            var result = Set<String>()
            for card in game.gameCards {
                result.insert(card.eyeColor)
            }
            return result
        }
        
        var possibleNose: Set<String> {
            var result = Set<String>()
            for card in game.gameCards {
                result.insert(card.noseSize)
            }
            return result
        }
        
        var possibleHair: Set<String> {
            var result = Set<String>()
            for card in game.gameCards {
                result.insert(card.hairColor)
            }
            return result
        }
        
        let possibleGlasses: Set = ["wearing", "not wearing"]
        let possibleGenders: Set = ["Man","Woman"]
        
        func createRow<T>(question: String, buttons: Set<T>, selector: Selector) -> UIStackView {
            let questionRow = UIStackView()
            questionRow.axis = .vertical
            let questionLabel = UILabel()
            questionLabel.text = question
            questionRow.addArrangedSubview(questionLabel)
            let buttonSet = UIStackView()
            buttonSet.axis = .horizontal
            buttonSet.distribution = .fillEqually
            for attribute in buttons {
                let button = UIButton(type: .system)
                button.sizeToFit()
                button.setTitle(attribute as? String, for: .normal)
                button.addTarget(self, action: selector, for: .touchUpInside)
                buttonSet.addArrangedSubview(button)
            }
            questionRow.addArrangedSubview(buttonSet)
            return questionRow
        }
        
        questionStack.addArrangedSubview(createRow(question: "Does your person have _____ eyes?", buttons: possibleEyes, selector: #selector(askEyes(_:))))
        questionStack.addArrangedSubview(createRow(question: "Does your person have a _____ nose?", buttons: possibleNose, selector: #selector(askNose(_:))))
        questionStack.addArrangedSubview(createRow(question: "Does your person have _____ hair?", buttons: possibleHair, selector: #selector(askHair(_:))))
        questionStack.addArrangedSubview(createRow(question: "Is your person _____ glasses?", buttons: possibleGlasses, selector: #selector(askGlasses(_:))))
        questionStack.addArrangedSubview(createRow(question: "Is your person a _____?", buttons: possibleGenders, selector: #selector(askGender(_:))))
        score.text = "Score: " + String(game.player.score)
    }
    
    func updateCardGrid() {
        for view in gridContainer.arrangedSubviews {
            view.removeFromSuperview()
        }
        var totalRows = game.gameCards.count / 4
        if totalRows < 1 { totalRows = 1 }
        for row in 0..<totalRows {
            let imageRow = UIStackView()
            imageRow.axis = .horizontal
            imageRow.distribution = .fillEqually
            imageRow.spacing = 2

            var upperCardIndex = row * 4 + 4
            if !game.gameCards.indices.contains(upperCardIndex) {
                upperCardIndex = game.gameCards.count
            }
            
            for index in row*4..<upperCardIndex {
                let card = game.gameCards[index]
                let cardImage = UIImageView()
                cardImage.contentMode = .scaleAspectFill
                cardImage.image = card.image
                var tapGestureRecognizer = UITapGestureRecognizer()
                if card.winner {
                    tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(guessWinningCard(_:)))
                } else {
                    tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(guessLosingCard(_:)))
                }
                cardImage.isUserInteractionEnabled = true
                cardImage.addGestureRecognizer(tapGestureRecognizer)
                imageRow.addArrangedSubview(cardImage)
            }
            while imageRow.arrangedSubviews.count < 4 {
                imageRow.addArrangedSubview(UIImageView())
            }
            gridContainer.addArrangedSubview(imageRow)
        }
        while gridContainer.arrangedSubviews.count < 4 {
            gridContainer.addArrangedSubview(UIStackView())
        }
        score.text = "Score: " + String(game.player.score)
    }
    
    @objc func askEyes(_ sender: UIButton) {
        if let chosen = sender.titleLabel?.text {
            var winner: Card { game.gameCards.filter { $0.winner == true }[0] }
            if winner.eyeColor == chosen {
                sender.setTitleColor(.green, for: .normal)
                let filtered = game.gameCards.filter { $0.eyeColor == chosen }
                game.gameCards = filtered
                game.player.score += 10
            } else {
                sender.setTitleColor(.red, for: .normal)
                game.player.score -= game.wrongQuestionPenalty
            }
            sender.isEnabled = false
            updateCardGrid()
        }
    }
    
    @objc func askNose(_ sender: UIButton) {
        if let chosen = sender.titleLabel?.text {
            var winner: Card { game.gameCards.filter { $0.winner == true }[0] }
            if winner.noseSize == chosen {
                sender.setTitleColor(.green, for: .normal)
                let filtered = game.gameCards.filter { $0.noseSize == chosen }
                game.gameCards = filtered
                game.player.score += 10
            } else {
                sender.setTitleColor(.red, for: .normal)
                game.player.score -= game.wrongQuestionPenalty
            }
            sender.isEnabled = false
            updateCardGrid()
        }
    }

    @objc func askHair(_ sender: UIButton) {
        if let chosen = sender.titleLabel?.text {
            var winner: Card { game.gameCards.filter { $0.winner == true }[0] }
            if winner.hairColor == chosen {
                sender.setTitleColor(.green, for: .normal)
                let filtered = game.gameCards.filter { $0.hairColor == chosen }
                game.gameCards = filtered
                game.player.score += 10
            } else {
                sender.setTitleColor(.red, for: .normal)
                game.player.score -= game.wrongQuestionPenalty
            }
            sender.isEnabled = false
            updateCardGrid()
        }
    }
    
    @objc func askGlasses(_ sender: UIButton) {
        if let chosen = sender.titleLabel?.text {
            var chosenBool: Bool {
                if chosen == "wearing" {
                    return true
                } else {
                    return false
                }
            }
            var winner: Card { game.gameCards.filter { $0.winner == true }[0] }
            if winner.glasses == chosenBool {
                sender.setTitleColor(.green, for: .normal)
                let filtered = game.gameCards.filter { $0.glasses == chosenBool }
                game.gameCards = filtered
                game.player.score += 10
            } else {
                sender.setTitleColor(.red, for: .normal)
                game.player.score -= game.wrongQuestionPenalty
            }
            sender.isEnabled = false
            updateCardGrid()
        }
    }
    
    @objc func askGender(_ sender: UIButton) {
        if let chosen = sender.titleLabel?.text {
            var winner: Card { game.gameCards.filter { $0.winner == true }[0] }
            if winner.gender == chosen {
                sender.setTitleColor(.green, for: .normal)
                let filtered = game.gameCards.filter { $0.gender == chosen }
                game.gameCards = filtered
                game.player.score += 10
            } else {
                sender.setTitleColor(.red, for: .normal)
                game.player.score -= game.wrongQuestionPenalty
            }
            sender.isEnabled = false
            updateCardGrid()
        }
    }

    @objc func guessWinningCard(_ sender: UITapGestureRecognizer) {
        let cardsRemaining = game.gameCards.count
        let bonusPoints = game.gameCards.count * game.perCardBonus
        let filtered = game.gameCards.filter { $0.winner == true }
        game.gameCards = filtered
        updateCardGrid()
        for view in questionStack.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        let winner = UILabel()
        winner.text = "You win!"
        winner.font = UIFont.boldSystemFont(ofSize: 60)
        questionStack.addArrangedSubview(winner)

        let remaining = UILabel()
        remaining.text = "There were \(cardsRemaining) cards left!"
        remaining.font = UIFont.systemFont(ofSize: 20)
        questionStack.addArrangedSubview(remaining)
        
        let bonus = UILabel()
        bonus.text = "Bonus points: " + String(bonusPoints)
        bonus.font = UIFont.boldSystemFont(ofSize: 30)
        questionStack.addArrangedSubview(bonus)

        score.text = "Final score: " + String(game.player.score + bonusPoints)

        let button = UIButton(type: .system)
        button.sizeToFit()
        button.setTitle("Play again", for: .normal)
        button.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        questionStack.addArrangedSubview(button)
    }
    
    @objc func newGame(_ sender: UIButton) {
        for view in questionStack.arrangedSubviews {
            view.removeFromSuperview()
        }
        game = Game()
        setUpGame()
        updateCardGrid()
    }
    
    @objc func guessLosingCard(_ sender: UITapGestureRecognizer) {
        let cardsRemaining = game.gameCards.count
        let bonusPoints = game.gameCards.count * game.perCardBonus
        let filtered = game.gameCards.filter { $0.winner == true }
        game.gameCards = filtered
        updateCardGrid()
        for view in questionStack.arrangedSubviews {
            view.removeFromSuperview()
        }
        
        let winner = UILabel()
        winner.text = "You lost!"
        winner.font = UIFont.boldSystemFont(ofSize: 60)
        questionStack.addArrangedSubview(winner)

        let remaining = UILabel()
        remaining.text = "There were \(cardsRemaining) cards left!"
        remaining.font = UIFont.systemFont(ofSize: 20)
        questionStack.addArrangedSubview(remaining)
        
        let bonus = UILabel()
        bonus.text = "Bonus points: -" + String(bonusPoints)
        bonus.font = UIFont.boldSystemFont(ofSize: 30)
        questionStack.addArrangedSubview(bonus)

        score.text = "Final score: " + String(game.player.score - bonusPoints)

        let button = UIButton(type: .system)
        button.sizeToFit()
        button.setTitle("Play again", for: .normal)
        button.addTarget(self, action: #selector(newGame), for: .touchUpInside)
        questionStack.addArrangedSubview(button)
    }
    
    @IBAction func saveChanges(unwindSegue: UIStoryboardSegue, sender: Any?) {
        let settings = unwindSegue.source as! SettingsViewController
        if let remainingBonusText = settings.remainingBonus.text {
            if let remainingBonus = Int(remainingBonusText) {
                game.perCardBonus = remainingBonus
            }
        }

        if let wrongPenaltyText = settings.wrongPenalty.text {
            if let wrongPenalty = Int(wrongPenaltyText) {
                game.wrongQuestionPenalty = wrongPenalty
            }
        }

    }
    
    @IBAction func cancelChanges(unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SettingsViewController {
            destination.game = game
        }
    }
}

