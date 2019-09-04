//
//  Game.swift
//  MultiplicationTables
//
//  Created by Apps on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import Foundation

class Game {
    let player: Player
    var gameScore: Int
    
    init(player: Player, gameScore: Int = 0) {
        self.player = player
        self.gameScore = gameScore
    }
}
