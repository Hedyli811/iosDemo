//
//  main.swift
//  Subway
//
//  Created by LI, Hedy on 2025-01-21.
//

import Foundation

let maxCapacity = 105
var currentPassengers = 0

struct SubwayStop {
    var name: String
    var busyLevel: Int
}
// MARK: - Errors Enumeration
enum SubwayError: Error {
    case invalidCity
    case tooManyPassengers
    
    var localizedDescription: String {
        switch self {
        case .invalidCity:
            return "Error: The subway system is available only in Boston."
        case .tooManyPassengers:
            return "Error:The train has exceeded its maximum capacity of \(maxCapacity)  passengers"
 
        }
    }
}


let stops = [
    SubwayStop(name: "Harvard Square", busyLevel: 5),
    SubwayStop(name: "Kendall", busyLevel: 8),
    SubwayStop(name: "Central Square", busyLevel: 7),
    SubwayStop(name: "Charles MGH", busyLevel: 4),
    SubwayStop(name: "Park Street", busyLevel: 10)
]

func runSimulation(city: String, trainName: String) {
    do {
        
        print("*** first run begins ***")
        try validateCity(city)

        for stop in stops {
            currentPassengers = Int.random(in: 0...maxCapacity)
            
            let passengersBoarding = calculateBoardingPassengers(busyLevel: stop.busyLevel)
            
            let passengersLeaving = Int.random(in: 0...currentPassengers)
            currentPassengers -= passengersLeaving
            currentPassengers += passengersBoarding
            
            
            if currentPassengers > maxCapacity {
                throw SubwayError.tooManyPassengers
            }
             
            print("   \(passengersLeaving) passengers leave the train")
            print("   \(passengersBoarding) new passengers at \(stop.name)")
            print("    \(currentPassengers) currently on board \n")
            print("a total of \(currentPassengers) passengers were left on 'the bullet' in \(city)")
        }
        
        print("*** 'the bullet' in boston has completed its full run with \(currentPassengers) in total ***")
        
    } catch {
        print(error.localizedDescription)
    }
}

func validateCity(_ city: String) throws {
    if city.lowercased() != "boston" {
        throw SubwayError.invalidCity
    }
}

func calculateBoardingPassengers(busyLevel: Int) -> Int {
    switch busyLevel {
    case 1...4:
        return 15
    case 5...7:
        return 40
    case 8...9:
        return 60
    case 10:
        return 80
    default:
        return 0
    }
}

// MARK: - 主程序
runSimulation(city: "Boston", trainName: "Red Line")
