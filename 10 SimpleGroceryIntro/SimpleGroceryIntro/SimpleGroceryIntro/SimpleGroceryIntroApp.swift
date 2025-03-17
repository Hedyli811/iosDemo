//
//  SimpleGroceryIntroApp.swift
//  SimpleGroceryIntro
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-03-10.
//

import SwiftUI

@main
struct SimpleGroceryIntroApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for : GroceryItem.self)
        }
    }
}
