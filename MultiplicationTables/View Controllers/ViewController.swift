//
//  ViewController.swift
//  MultiplicationTables
//
//  Created by Kevin Tanner on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var leaderboardTableView: UITableView!
        /// Multiplication Outlets
        @IBOutlet weak var one: UIButton!
        @IBOutlet weak var two: UIButton!
        @IBOutlet weak var three: UIButton!
        @IBOutlet weak var four: UIButton!
        @IBOutlet weak var five: UIButton!
        @IBOutlet weak var six: UIButton!
        @IBOutlet weak var seven: UIButton!
        @IBOutlet weak var eight: UIButton!
        @IBOutlet weak var nine: UIButton!
        @IBOutlet weak var ten: UIButton!
        @IBOutlet weak var eleven: UIButton!
        @IBOutlet weak var twelve: UIButton!
        /// Difficulty Outlets
        @IBOutlet weak var easy: UIButton!
        @IBOutlet weak var medium: UIButton!
        @IBOutlet weak var hard: UIButton!
    
    // MARK - Properties
    var numberMultiplier = 0
    var numberOne: Bool = false
    var numberTwo: Bool = false
    var numberThree: Bool = false
    var numberFour: Bool = false
    var numberFive: Bool = false
    var numberSix: Bool = false
    var numberSeven: Bool = false
    var numberEight: Bool = false
    var numberNine: Bool = false
    var numberTen: Bool = false
    var numberEleven: Bool = false
    var numberTwelve: Bool = false
    var difficulty: Int = 2
    var difficultyEasy: Bool = false
    var difficultyMedium: Bool = true
    var difficultyHard: Bool = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTableView.delegate = self
        leaderboardTableView.dataSource = self
        
        medium.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(userTappedView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        leaderboardTableView.reloadData()
        playerNameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Methods
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func userTappedView(_ sender: Any) {
        playerNameTextField.resignFirstResponder()
    }

    // MARK: - Actions
    /// Multiplier Actions
    @IBAction func oneButtonTapped(_ sender: Any) {
        if numberOne == true {
            numberOne = false
            one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberOne = true
            one.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 1
        }
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func twoButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberTwo == true {
            two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberTwo = false
            numberMultiplier = 0
        } else {
            numberTwo = true
            two.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 2
        }
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func threeButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberThree == true {
            numberThree = false
            three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberThree = true
            three.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 3
        }
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func fourButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberFour == true {
            numberFour = false
            four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberFour = true
            four.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 4
        }
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func fiveButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberFive == true {
            numberFive = false
            five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberFive = true
            five.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 5
        }
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func sixButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberSix == true {
            numberSix = false
            six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberSix = true
            six.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 6
        }
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func sevenButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberSeven == true {
            numberSeven = false
            seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberSeven = true
            seven.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 7
        }
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func eightButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberEight == true {
            numberEight = false
            eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberEight = true
            eight.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 8
        }
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func nineButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberNine == true {
            numberNine = false
            nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberNine = true
            nine.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 9
        }
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func tenButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberTen == true {
            numberTen = false
            ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 10
        } else {
            numberTen = true
            ten.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 10
        }
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func elevenButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberEleven == true {
            numberEleven = false
            eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberEleven = true
            eleven.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 11
        }
        numberTwelve = false
        twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func twelveButtonTapped(_ sender: Any) {
        numberOne = false
        one.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTwo = false
        two.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberThree = false
        three.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFour = false
        four.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberFive = false
        five.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSix = false
        six.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberSeven = false
        seven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEight = false
        eight.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberNine = false
        nine.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberTen = false
        ten.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        numberEleven = false
        eleven.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        if numberTwelve == true {
            numberTwelve = false
            twelve.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            numberMultiplier = 0
        } else {
            numberTwelve = true
            twelve.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            numberMultiplier = 12
        }
    }
    
    /// Difficulty Actions
    @IBAction func easyButtonTapped(_ sender: Any) {
        if difficultyEasy == true {
            difficulty = 1
            easy.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            return
        } else if difficultyEasy == false {
            difficultyEasy = true
            easy.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            difficultyMedium = false
            medium.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            difficultyHard = false
            hard.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            difficulty = 1
        }
    }
    @IBAction func mediumButtonTapped(_ sender: Any) {
        if difficultyMedium == true {
            difficulty = 2
            medium.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            return
        } else if difficultyMedium == false {
            difficultyEasy = false
            easy.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            difficultyMedium = true
            medium.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            difficultyHard = false
            hard.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            difficulty = 2
        }
    }
    @IBAction func hardButtonTapped(_ sender: Any) {
        if difficultyHard == true {
            difficulty = 3
            hard.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            return
        } else if difficultyHard == false {
            difficultyEasy = false
            easy.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            difficultyMedium = false
            medium.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            difficultyHard = true
            hard.layer.backgroundColor = #colorLiteral(red: 0, green: 0.231372549, blue: 0.2745098039, alpha: 1)
            difficulty = 3
        }
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        playerNameTextField.resignFirstResponder()
        if playerNameTextField.text != "" {
        performSegue(withIdentifier: "startGame", sender: self)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Identifier
        if segue.identifier == "startGame" {
            // Destination
            guard let destinationVC = segue.destination as? GameViewController else { return }
            
            if let playerName = playerNameTextField.text, !playerName.isEmpty {
                let existingPlayer = PlayerController.sharedInstance.leaderboard.filter({ $0.name == playerName}).map({ return $0})
                
                if let currentPlayer = existingPlayer.first {
                    destinationVC.player = currentPlayer
                } else {
                
                    let newPlayer = PlayerController.sharedInstance.createPlayer(playerName: playerName, multiplier: self.numberMultiplier, difficulty: self.difficulty, highScore: 0)
            
                destinationVC.player = newPlayer
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlayerController.sharedInstance.leaderboard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerHighScore", for: indexPath)
        
        let player = PlayerController.sharedInstance.leaderboard.sorted(by: >)[indexPath.row]
        
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = String(player.highScore)
        
        return cell
    }
}

