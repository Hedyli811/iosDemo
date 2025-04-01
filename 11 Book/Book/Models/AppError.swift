//
//  AppError.swift
//  Book
//
//  Created by LI, Hedy on 2025-03-26.
//
 
enum AppError: Error {
    case noUserFound
    case invalidInput
    
    var errorDescription: String? {
        switch self {
        case .noUserFound:
            return "create user first"
        case .invalidInput:
            return "can not be empty"
        }
    }
}
