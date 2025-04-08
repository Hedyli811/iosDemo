//
//  BookAndAuthorDemoApp.swift
//  BookAndAuthorDemo
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-03-31.
//

import SwiftUI


struct BookAndAuthorDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .modelContainer(for :[Book.self, Author.self, BookCover.self])
        }
    }
}
