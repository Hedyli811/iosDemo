//
//  AppError.swift
//  Book
//
// Mary Welcey Guillen
//

import SwiftUI
import SwiftData
 
enum AppError: LocalizedError {
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
