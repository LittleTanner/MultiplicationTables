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
    
    var seconds = 60
    var timer = Timer()
    var isTimerRunning = true
    
    
    // MARK: - Outlets
    @IBOutlet weak var number1Label: UILabel!
    @IBOutlet weak var number2Label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        runTimer()
        updateViews()
        answerTextField.becomeFirstResponder()
        answerTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let player = player else { return }
        
        if textField.text != answer {
            return
        } else {
            if answerTextField.text == answer {
                score += 1
                updateViews()
            } else if score > player.highScore {
                PlayerController.sharedInstance.updatePlayerHighScore(player: player, highScore: score)
                navigationController?.popViewController(animated: true)
            } else {
                navigationController?.popViewController(animated: true)
            }
        }
    }
    
    func updateViews() {
        scoreLabel.text = "\(score)"
        answerTextField.text = ""
        equationGenerator()
    }
    
    func equationGenerator() {
        
        switch seconds {
        case _ where seconds <= 60 && seconds > 50:
            let number1 = Int.random(in: 0..<4)
            let number2 = Int.random(in: 0..<4)
            setEquation(number1: number1, number2: number2)
        case _ where seconds <= 50 && seconds > 40:
            let number1 = Int.random(in: 4..<7)
            let number2 = Int.random(in: 4..<7)
            setEquation(number1: number1, number2: number2)
        case _ where seconds <= 40 && seconds > 30:
            let number1 = Int.random(in: 7..<10)
            let number2 = Int.random(in: 7..<10)
            setEquation(number1: number1, number2: number2)
        case _ where seconds <= 30 && seconds > 20:
            let number1 = Int.random(in: 10..<13)
            let number2 = Int.random(in: 10..<13)
            setEquation(number1: number1, number2: number2)
        case _ where seconds <= 20 && seconds > 10:
            let number1 = Int.random(in: 13..<16)
            let number2 = Int.random(in: 13..<16)
            setEquation(number1: number1, number2: number2)
        default:
            let number1 = Int.random(in: 16..<19)
            let number2 = Int.random(in: 16..<19)
            setEquation(number1: number1, number2: number2)
        }
    }
    
    func setEquation(number1: Int, number2: Int) {
        number1Label.text = "\(number1)"
        number2Label.text = "\(number2)"
        answer = "\(number1 * number2)"
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        timerLabel.text = "\(seconds)" //This will update the label.
        if seconds == 0 {
            guard let player = player else { return }
            if score > player.highScore {
                PlayerController.sharedInstance.updatePlayerHighScore(player: player, highScore: score)
                navigationController?.popViewController(animated: true)
            } else {
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
