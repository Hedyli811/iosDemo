//
//  GroceryViewModel.swift
//  View+ViewModelGrocery
//
//  Created by LI, Hedy on 2025-03-18.
//

import SwiftData
import SwiftUI

@Observable
class PostsViewModel{
    var posts: [Post] = []
    var errorMessage : String?
    
    func fetchPosts() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{
            errorMessage = "invalid url"
            return
        }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            posts = try JSONDecoder().decode([Post].self, from: data)
            errorMessage = nil
        }catch{
            errorMessage = error.localizedDescription
        }
    }
     
    
    private func handleError(_ error:GroceryError){
        errorMessage = error.localizedDescription
    }
    
    
}
