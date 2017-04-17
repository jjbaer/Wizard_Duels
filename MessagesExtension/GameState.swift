//
//  GameState.swift
//  Wizard_Duels
//
//  Created by Jenna on 3/7/17.
//  Copyright © 2017 Jenna. All rights reserved.
//

import Foundation

class GameState {
    var currentTexture: String
    var currentPlayer: String
    var p1Move: String
    var p2Move: String
    var gameResult: String
    var round: Int
    
    init(currentTexture: String, currentPlayer: String, p1Move: String, p2Move: String, gameResult: String, round: Int) {
        self.currentTexture = currentTexture
        self.currentPlayer = currentPlayer
        self.p1Move = p1Move
        self.p2Move = p2Move
        self.gameResult = gameResult
        self.round = round
    }
    
    func determineResult() -> String {
        
        var oponentMove: String
        
        // if this is a new game
        if (p2Move == "Z") {
            return "incomplete"
        }
        
        // determine winner from completed exchange
        if (currentPlayer == "X") {
            oponentMove = p2Move
        } else {
            oponentMove = p1Move
        }
        
        switch currentTexture {
        case "rock":
            switch oponentMove {
            case "rock":
                gameResult = "tie"
            case "paper":
                gameResult = "lose"
            case "scisors":
                gameResult = "win"
            default:
                gameResult = "tie"
            }
        case "paper":
            switch oponentMove {
            case "rock":
                gameResult = "win"
            case "paper":
                gameResult = "tie"
            case "scisors":
                gameResult = "lose"
            default:
                gameResult = "tie"
            }
        case "scisors":
            switch oponentMove {
            case "rock":
                gameResult = "lose"
            case "paper":
                gameResult = "win"
            case "scisors":
                gameResult = "tie"
            default:
                gameResult = "tie"
            }
        default:
            gameResult = "incomplete"
        }
        
        return gameResult
    }
}
