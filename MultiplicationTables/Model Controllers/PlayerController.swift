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
    
    init() {
        loadFromPersistentStorage()
    }
    
    // CRUD
    
    // Create Player
    func createPlayer(playerName: String, highScore: Int) -> Player {
        let player = Player(name: playerName, highScore: highScore)
        leaderboard.append(player)
        saveToPersistentStorage()
        return player
    }
    
    // Update
    func updatePlayerHighScore(player: Player, highScore: Int) {
        player.highScore = highScore
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "MultiplicationTables.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(leaderboard)
            try data.write(to: fileURL())
        } catch let error {
            print("There was an error saving: \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStorage() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let leaderboard = try jsonDecoder.decode([Player].self, from: data)
            self.leaderboard = leaderboard
        } catch let error {
            print("There was an error loading data: \(error.localizedDescription)")
        }
    }

}
