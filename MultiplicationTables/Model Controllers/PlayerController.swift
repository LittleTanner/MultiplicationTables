//
//  PlayerController.swift
//  MultiplicationTables
//
//  Created by Kevin Tanner on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import Foundation

class PlayerController {
    
    // Singleton
    static let sharedInstance = PlayerController()
    
    // Source of truth
    var leaderboard: [Player] = []
    
    // CRUD
    
    // Create Player
    func createPlayer(playerName: String, highScore: Int) -> Player {
        let player = Player(name: playerName, highScore: highScore)
        leaderboard.append(player)
        return player
    }
    
    // Update
    func updatePlayerHighScore(player: Player, highScore: Int) {
        player.highScore = highScore
    }
}
