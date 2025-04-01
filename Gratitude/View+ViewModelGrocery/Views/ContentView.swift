//
//  ContentView.swift
//  View+ViewModelGrocery
//
//  Created by LI, Hedy on 2025-03-18.
//

import SwiftUI
import SwiftData
 


struct ContentView: View {
    @Environment(PostsViewModel.self) private var viewModel  // Injecting the PostsViewModel
    @State private var showErrorAlert = false  // State variable to trigger error alerts

    var body: some View {
        NavigationStack {
            // List of posts displayed on the screen
            List(viewModel.posts) { post in
                NavigationLink(value: post) {
                    // Display post details here
                    VStack(alignment: .leading) {
                        Text(post.title)  // Post title
                            .font(.headline)
                        Text(post.body)   // Post body content
                            .font(.subheadline)
                    }
                }
            }
            .navigationBarHidden(true)  // Hides the navigation bar
            .navigationDestination(for: Post.self) { post in
                PostDetailView(post: post)  // Navigates to PostDetailView when selecting a post
            }
            .task {
                await viewModel.fetchPosts()  // Asynchronously fetch posts from the view model
                if viewModel.errorMessage != nil {
                    showErrorAlert = true  // Show alert if there's an error
                }
            }
            .alert("Error", isPresented: $showErrorAlert, presenting: viewModel.errorMessage) { _ in
                Button("OK", role: .cancel) { }
            } message: { errorMessage in
                Text(errorMessage)  // Display the error message
            }
        }
    }
}
