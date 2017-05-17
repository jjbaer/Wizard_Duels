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
    var p1Health: String
    var p2Health: String
    var p2Move: String
    var gameResult: String
    var p1Round: String
    var p2Round: String
    var round: Int
    
    init(currentTexture: String, currentPlayer: String, p1Move: String, p2Move: String, gameResult: String, round: Int, p1Health: String, p2Health: String, p1Round: String, p2Round: String) {
        self.currentTexture = currentTexture
        self.currentPlayer = currentPlayer
        self.p1Move = p1Move
        self.p2Move = p2Move
        self.p1Health = p1Health
        self.p2Health = p2Health
        self.gameResult = gameResult
        self.p1Round = p1Round
        self.p2Round = p2Round
        self.round = round
    }
    
    func determineResult() {
        var oponentMove: String
        
        incrementCurrentPlayerRound()
        // if this is a new game
        if (p1Round != p2Round) {
            gameResult = "incomplete"
            return
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
            default:
                gameResult = "incomplete"
            }
        default:
            gameResult = "incomplete"
        }
        
        calculateHealth()
    }
    
    // this one deals with converting strings --> ints and back
    func calculateHealth() {
        if (currentPlayer == "1") {
            if (gameResult == "lost") {
                p1Health = String((Int(p1Health)! - 1))
            } else if (gameResult == "won") {
                p2Health = String((Int(p2Health)! - 1))
            }
            
        }
        else {
            if (gameResult == "lost") {
                p2Health = String((Int(p2Health)! - 1))
            } else if (gameResult == "won") {
                p1Health = String((Int(p1Health)! - 1))
            }
        }
    }
    
    // next time: determine if there is a loser
    func isLoser() -> Bool {
        return false
    }
    
    // increment the round for the current player
    func incrementCurrentPlayerRound() {
        
        if (currentPlayer == "1") {
            p1Round = String(Int(p1Round)! + 1);
        } else {
            p2Round = String(Int(p2Round)! + 1);
        }
    }
}
