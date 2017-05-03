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
        case "ivy":
            switch oponentMove {
            case "ivy":
                gameResult = "tied"
                print("1")
            case "fire":
                gameResult = "lost"
            case "water":
                gameResult = "won"
            default:
                gameResult = "incomplete"
            }
        case "fire":
            switch oponentMove {
            case "ivy":
                gameResult = "won"
            case "fire":
                gameResult = "tied"
                print("2")
            case "water":
                gameResult = "lost"
            default:
                gameResult = "incomplete"
            }
        case "water":
            switch oponentMove {
            case "ivy":
                gameResult = "lost"
            case "fire":
                gameResult = "won"
            case "water":
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
