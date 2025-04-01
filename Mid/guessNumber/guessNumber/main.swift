//
//  main.swift
//  guessNumber
//
//  Created by LI, Hedy on 2025-01-21.
//
import Foundation

func getUserInput(prompt: String) -> String {
    var input: String? // Local variable to store input

    // Loop to keep the user here until they enter a valid value
    repeat {
        // Prompt the user for input
        print(prompt, terminator: " ")
        
        // Read input
        input = readLine()
        
        if input == nil || input!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            print("Input can't be empty... Please try again!")
        }
    } while input == nil || input!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty

    return input!
}

// Get the user's name
let name = getUserInput(prompt: "Enter your name:")
print("Welcome $name)!")

// Generate a random number between 1 and 10
let number = Int.random(in: 1...10)

var userGuess: Int?

// Loop until the user guesses the right number
repeat {
    let userInput = getUserInput(prompt: "Enter a number between 1 and 10:")
    
    if let guess = Int(userInput) {
        userGuess = guess
        
        if userGuess! > number {
            print("Too big!")
        } else if userGuess! < number {
            print("Too small!")
        }
    } else {
        print("Please enter a valid number.")
    }
    
} while userGuess != number

print("Congratulations! You guessed the number $number).")
