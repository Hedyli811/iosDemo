//
//  GroceryEnums.swift
//  View+ViewModelGrocery
//
//  Created by LI, Hedy on 2025-03-18.
//

import SwiftUI

enum GroceryError: Error, LocalizedError {
    case invalidItemName
    case failedToSave(String)
    case failedToDelete(String)
 
    var errorDescription: String? {
        switch self {
        case .invalidItemName:
            return "Invalid item name. Please use only letters, numbers, spaces (no blanks), and basic punctuation."
        case .failedToSave(let message):
            return "Failed to save item: \(message)"
        case .failedToDelete(let message):
            return "Failed to delete item: \(message)"
        }
    }
}
