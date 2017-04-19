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
        if (p2Move == "Z" || p1Move == "Z") {
            return "incomplete"
        }
        
        // determine winner from completed exchange
        if (currentPlayer == "1") {
            oponentMove = p2Move
        } else {
            oponentMove = p1Move
        }
        
        print("opponent move: " + oponentMove)
        
        switch currentTexture {
        case "rock":
            switch oponentMove {
            case "rock":
                gameResult = "tied"
                print("1")
            case "paper":
                gameResult = "lost"
            case "scissors":
                gameResult = "won"
            default:
                gameResult = "incomplete"
            }
        case "paper":
            switch oponentMove {
            case "rock":
                gameResult = "won"
            case "paper":
                gameResult = "tied"
                print("2")
            case "scissors":
                gameResult = "lost"
            default:
                gameResult = "incomplete"
            }
        case "scissors":
            switch oponentMove {
            case "rock":
                gameResult = "lost"
            case "paper":
                gameResult = "won"
            case "scissors":
                gameResult = "tied"
                print("3")
            default:
                gameResult = "incomplete"
            }
        default:
            gameResult = "incomplete"
        }
        
        return gameResult
    }
}
