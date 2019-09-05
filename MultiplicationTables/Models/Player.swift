//
//  Player.swift
//  MultiplicationTables
//
//  Created by Apps on 9/4/19.
//  Copyright © 2019 Kevin Tanner. All rights reserved.
//

import Foundation

class Player: Codable {
    var name: String
    var highScore: Int
    
    init(name: String, highScore: Int = 0) {
        self.name = name
        self.highScore = highScore
    }
}

extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name
    }
}

extension Player: Comparable {
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.highScore < rhs.highScore
    }
}
