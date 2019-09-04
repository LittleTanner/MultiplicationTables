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
        // Do any additional setup after loading the view.
        leaderboardTableView.delegate = self
        leaderboardTableView.dataSource = self
        
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(userTappedView(_:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }

    // MARK: - Actions

    @IBAction func startButtonTapped(_ sender: Any) {
        
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
            
                // Object sent
                destinationVC.player = playerName
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
        
        let player = PlayerController.sharedInstance.leaderboard[indexPath.row]
        
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = String(player.highScore)
        
        return cell
    }
}

