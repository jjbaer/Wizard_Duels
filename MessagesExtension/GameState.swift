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
    var xMove: String
    var oMove: String
    var gameResult: String
    
    init(currentTexture: String, currentPlayer: String, xMove: String, oMove: String, gameResult: String) {
        self.currentTexture = currentTexture
        self.currentPlayer = currentPlayer
        self.xMove = xMove
        self.oMove = oMove
        self.gameResult = gameResult
    }
    
    func determineResult() -> String {
        
        var oponentMove: String
        
        // if this is a new game
        if (oMove == "Z") {
            return "Z"
        }
        
        // determine winner from completed exchange
        if (currentPlayer == "X") {
            oponentMove = oMove
        } else {
            oponentMove = xMove
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
            gameResult = "tie"
        }
        
        return gameResult
    }
}
