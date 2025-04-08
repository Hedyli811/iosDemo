//
//  BookApp.swift
//  Book
//
//  Created by LI, Hedy on 2025-03-26.
//

import SwiftUI
import SwiftData

@main
struct ReadingLogApp: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
        }
        .modelContainer(for: [User.self, Book.self])
    }
}
