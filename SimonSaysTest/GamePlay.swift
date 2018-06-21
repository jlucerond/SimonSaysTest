//
//  GamePlay.swift
//  SimonSaysTest
//
//  Created by Joe Lucero on 6/20/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

class GamePlay {
   private(set) var correctMoves: [Int] = []
   private var userMoves: [Int] = []
   
   enum Move {
      case correctAndContinue
      case correctAndNewRound
      case incorrect
   }
   
   func userSelected(_ value: Int) -> Move {
      userMoves.append(value)
      
      if correctMoves.count == userMoves.count {
         if correctMoves == userMoves {
            print("user was correct, make new round")
            createNextRound()
            return .correctAndNewRound
         } else {
            print("user was incorrect, game over")
            return .incorrect
         }
      } else {
         for number in 0..<userMoves.count {
            if correctMoves[number] != userMoves[number] {
               print("user guessed wrong mid-round")
               return .incorrect
            }
         }
         print("user was right, keep playing")
         return .correctAndContinue
      }
      
   }
   
   func createNextRound() {
      correctMoves.append(pickRandomNumberBetween0And3())
      userMoves = []
      print("here's the right moves: \(correctMoves)")
   }
   
   func startNewGame() {
      correctMoves = [pickRandomNumberBetween0And3(), pickRandomNumberBetween0And3(), pickRandomNumberBetween0And3()]
      userMoves = []
      
      print("here's the right moves: \(correctMoves)")
   }
   
   private func pickRandomNumberBetween0And3() -> Int {
      return Int(arc4random_uniform(4))

      // return Int.random(4)
   }
   
}
