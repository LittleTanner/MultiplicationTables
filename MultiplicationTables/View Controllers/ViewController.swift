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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        leaderboardTableView.delegate = self
        leaderboardTableView.dataSource = self
        
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

    // MARK: - Actions

    @IBAction func startButtonTapped(_ sender: Any) {
        playerNameTextField.resignFirstResponder()
        if playerNameTextField.text != "" {
        performSegue(withIdentifier: "startGame", sender: self)
        }
    }
    
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
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Identifier
        if segue.identifier == "startGame" {
            // Destination
            guard let destinationVC = segue.destination as? GameViewController else { return }
            
            
            // Object to send
            if let playerName = playerNameTextField.text, !playerName.isEmpty {
                let existingPlayer = PlayerController.sharedInstance.leaderboard.filter({ $0.name == playerName}).map({ return $0})
                
                if let currentPlayer = existingPlayer.first {
                    destinationVC.player = currentPlayer
                } else {
                
                let newPlayer = PlayerController.sharedInstance.createPlayer(playerName: playerName, highScore: 0)
            
                // Object sent
                destinationVC.player = newPlayer
                }
            }
        }
    }
} // End of class

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

