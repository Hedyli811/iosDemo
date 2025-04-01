//
//  View_ViewModelGroceryApp.swift
//  View+ViewModelGrocery
//
//  Created by LI, Hedy on 2025-03-18.
//

import SwiftUI
import SwiftData

@main
struct ViewModelApi_PostsApp: App{
    let viewModel = PostsViewModel()
    
    var body: some Scene{
        WindowGroup{
            ContentView().environment(viewModel)
        }
    }
}
