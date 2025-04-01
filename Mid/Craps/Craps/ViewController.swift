//
//  ViewController.swift
//  Craps
//
//  Created by LI, Hedy on 2025-01-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    
    @IBAction func roll(_ sender: Any) {
        playCraps()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum GameState{
      case win
      case point
      case lose
    }

    enum CrapsError: Error{
      case invalidGameState
      case invalidDiceRoll
    }

    func rollDice() throws -> (die1: Int, die2: Int) {
      let die1 = Int.random(in: 1...6)
      let die2 = Int.random(in: 1...6)
      guard (1...6).contains(die1) && (1...6).contains(die2) else{
        throw CrapsError.invalidDiceRoll
      }
      return (die1, die2)
    }
     
    func determineGameState(for roll: Int) throws -> GameState {
      switch roll {
        case 7,11:
          return GameState.win
        case 2,3,12:
          return .lose
        case 4,5,6,8,9,10:
          return .point
        default:
        throw CrapsError.invalidGameState
      }
    }
     
    func playPoint(point: Int) throws -> GameState {
      while true {
        let roll = try rollDice()
        let sum = roll.die1 + roll.die2
        print("Player rolled: \(roll.die1) + \(roll.die2) = \(sum)")
     
        if sum == point{
          return .win
        } else if sum == 7{
          return .lose
        }
      }
    }
     
     
    func playCraps() {
        do {
            let (die1, die2) = try rollDice()
            let initialRoll = die1 + die2

            self.resultLabel.text = "Initial roll: \(die1) + \(die2) = \(initialRoll) "

            let initialGameState = try determineGameState(for: initialRoll)

            switch initialGameState {
            case .win:
                DispatchQueue.main.async {
                    self.resultLabel.text? += "\nYou win!"
                }

            case .lose:
                DispatchQueue.main.async {
                    self.resultLabel.text? += "\nYou lose!"
                }

            case .point:
                let point = initialRoll
                DispatchQueue.main.async {
                    self.resultLabel.text? += "\nPoint is \(point)"
                }

                do {
                    let pointGameState = try playPoint(point: point)

                    switch pointGameState {
                    case .win:
                        DispatchQueue.main.async {
                            self.resultLabel.text? += "\nYou win!"
                        }

                    case .lose:
                        DispatchQueue.main.async {
                            self.resultLabel.text? += "\nYou lose!"
                        }

                    case .point:
                        throw CrapsError.invalidGameState
                    }
                }
            }

        } catch CrapsError.invalidDiceRoll {
            DispatchQueue.main.async {
                self.resultLabel.text = "Error: The dice roll was out of range"
            }
        } catch CrapsError.invalidGameState {
            DispatchQueue.main.async {
                self.resultLabel.text = "Error: The current game state is invalid. Please restart."
            }
        } catch {
            DispatchQueue.main.async {
                self.resultLabel.text = "An unexpected error occurred: $error)"
            }
        }
    }


}

