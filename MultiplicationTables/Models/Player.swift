//
//  Player.swift
//  MultiplicationTables
//
//  Created by Apps on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import Foundation

class Player {
    let name: String
    var highScore: Int
    
    init(name: String, highScore: Int = 0) {
        self.name = name
        self.highScore = highScore
    }
}
