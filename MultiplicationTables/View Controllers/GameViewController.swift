//
//  GameViewController.swift
//  MultiplicationTables
//
//  Created by Apps on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    var player: String = ""
    
    // MARK: - Outlets
    @IBOutlet weak var number1Label: UILabel!
    @IBOutlet weak var number2Label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let answer = equationGenerator()
    }
    
    @IBAction func submitAnswerButtonTapped(_ sender: Any) {
    }
    
    
    func equationGenerator() -> String {
        let number1 = Int.random(in: 0..<20)
        let number2 = Int.random(in: 0..<20)
        
        number1Label.text = "\(number1)"
        number2Label.text = "\(number2)"
        
        return "\(number1 * number2)"
    }
    
    
    
    //submitAnswerButtonTapped {
        // if answerTextField?.text == answer {
    
}
