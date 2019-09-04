//
//  GameViewController.swift
//  MultiplicationTables
//
//  Created by Apps on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var player: Player?
    var answer = ""
    var score: Int = 0
    
    
    // MARK: - Outlets
    @IBOutlet weak var number1Label: UILabel!
    @IBOutlet weak var number2Label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func submitAnswerButtonTapped(_ sender: Any) {
//        if answerTextField.text == answer {
//            score += 1
//            updateViews()
//        }
//        if answerTextField.text != answer {
//        if PlayerController.sharedInstance.leaderboard.isEmpty {
//                PlayerController.sharedInstance.createPlayer(playerName: self.player, highScore: score)
//                navigationController?.popViewController(animated: true)
//            } else {
//                for aplayer in PlayerController.sharedInstance.leaderboard {
//                    if aplayer.name == self.player {
//                        if score > aplayer.highScore {
//                        PlayerController.sharedInstance.updatePlayerHighScore(player: aplayer, highScore: score)
//                        } else {
//                            navigationController?.popViewController(animated: true)
//                        }
//                    } else {
//                        PlayerController.sharedInstance.createPlayer(playerName: self.player, highScore: score)
//                        navigationController?.popViewController(animated: true)
//                    }
//                }
//            }
//        }
        guard let player = player else { return }
        
        if answerTextField.text == answer {
            score += 1
            updateViews()
        } else if PlayerController.sharedInstance.leaderboard.contains(player) && score > player.highScore {
            PlayerController.sharedInstance.updatePlayerHighScore(player: player, highScore: score)
            navigationController?.popViewController(animated: true)
        } else if PlayerController.sharedInstance.leaderboard.contains(player) {
            navigationController?.popViewController(animated: true)
        } else {
            PlayerController.sharedInstance.createPlayer(playerName: player.name, highScore: score)
            navigationController?.popViewController(animated: true)
            }
        
//        if answerTextField.text != answer {
//            if PlayerController.sharedInstance.leaderboard.isEmpty {
//                PlayerController.sharedInstance.createPlayer(playerName: self.player, highScore: score)
//                navigationController?.popViewController(animated: true)
//            } else {
//                for aplayer in PlayerController.sharedInstance.leaderboard {
//                    if aplayer.name == self.player {
//                        if score > aplayer.highScore {
//                            PlayerController.sharedInstance.updatePlayerHighScore(player: aplayer, highScore: score)
//                        } else {
//                            navigationController?.popViewController(animated: true)
//                        }
//                    } else {
//                        PlayerController.sharedInstance.createPlayer(playerName: self.player, highScore: score)
//                        navigationController?.popViewController(animated: true)
//                    }
//                }
//            }
//        }
    }
    
    func updateViews() {
        scoreLabel.text = "\(score)"
        answerTextField.text = ""
        equationGenerator()
    }
    
    func equationGenerator() {
        let number1 = Int.random(in: 0..<3)
        let number2 = Int.random(in: 0..<3)
        
        number1Label.text = "\(number1)"
        number2Label.text = "\(number2)"
        
        answer = "\(number1 * number2)"
    }
}
