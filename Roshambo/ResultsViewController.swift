//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Olive Iosello on 2/3/21.
//

import UIKit

enum Shape: String {
    case Rock = "ROCK"
    case Paper = "PAPER"
    case Scissors = "SCISSORS"

    static func randomShape() -> Shape {
        let shapes = ["ROCK", "PAPER", "SCISSORS"]
        let randomChoice = Int(arc4random_uniform(3))
        return Shape(rawValue: shapes[randomChoice])!
    }
}

class ResultsViewController: UIViewController {

    @IBOutlet private weak var resultsImage: UIImageView!
    @IBOutlet private weak var resultsLabel: UILabel!

    var userChoice: Shape!
    private let opponentChoice: Shape = Shape.randomShape()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayResult()
    }

    private func displayResult() {
        var imageName: String
        var text: String
        let matchup = "\(userChoice.rawValue) vs. \(opponentChoice.rawValue)"

        switch (userChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text = "\(matchup) tied!"
            imageName = "tie"
        case (.Rock, .Scissors), (.Paper, .Rock), (.Scissors, .Paper):
            text = "\(matchup) you win!"
            imageName = "\(userChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text = "\(matchup) you lose!"
            imageName = "\(opponentChoice.rawValue)-\(userChoice.rawValue)"
        }

        imageName = imageName.lowercased()
        resultsImage.image = UIImage(named: imageName)
        resultsLabel.text = text
    }
    
    @IBAction private func playAgain() {
        dismiss(animated: true, completion: nil)
    }

}
