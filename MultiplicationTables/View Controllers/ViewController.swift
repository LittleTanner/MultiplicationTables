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
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Actions

    @IBAction func startButtonTapped(_ sender: Any) {
        
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
    
}

