//
//  main.swift
//  CL_sayMessage
//
//  Created by LI, Hedy on 2025-01-21.
//
import Foundation
//create a function getUserInput, string prompt param, returns string
 
var input: String? //value is nil
 
func getUserInput(prompt: String) -> String {
  //loop to keep them here until they enter a valid value
  
  while input == nil || input!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
    
    //prompt the user for input
    print(prompt, terminator: " ")
    
    //read optional input
    input = readLine()
    
    if input == nil || input!.isEmpty {
      print("Input can't be empty...Please try again!")
    }
    
  }
  
 
  return input!
}
 
let userInput = getUserInput(prompt: "Enter a message you want to say: ")
print("You entered: \(userInput)")
 
