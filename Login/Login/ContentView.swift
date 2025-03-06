//
//  ContentView.swift
//  Login
//
//  Created by LI, Hedy on 2025-03-04.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
       @State private var password: String = ""
       @State private var loginMessage: String = ""
       @State private var lastLoginDate: Date?
       @State private var isFirstLogin: Bool = true // Determine if it's the first login

       private let savedUsernameKey = "savedUsername"
       private let lastLoginDateKey = "lastLoginDate"
       private let hardcodedPassword = "Secret"
    
    
    var body: some View {
        VStack {
            Image(ImageResource.organicallyYours)
                .resizable()
                .scaledToFit()
                .frame(width: 80,height: 80)
                .padding()
        }
        .padding()
        Text("Welcome!Please Log In").font(.largeTitle)
        TextField("Enter username", text: $username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .padding()
        SecureField("Enter Password", text: $password)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .padding()
        Button("Log In") {
            authenticateUser()

        }
        Text(loginMessage)
        if let lastLogin = lastLoginDate {
                      Text("Last login: \(formattedDate(lastLogin))")
                      Text("\(timeElapsed(since: lastLogin)) ago")
                  } else {
                      Text(isFirstLogin ? "This is your first log in" : "")
                  }
        
    }
    
    
    private func authenticateUser() {
        let savedUsername = UserDefaults.standard.string(forKey: savedUsernameKey)

        if username.isEmpty || password.isEmpty {
            loginMessage = "Username and password cannot be empty."
            return
        }

        if savedUsername == nil {
            // First-time user
            UserDefaults.standard.set(username, forKey: savedUsernameKey)
            lastLoginDate = Date() // Set last login date
            UserDefaults.standard.set(lastLoginDate!, forKey: lastLoginDateKey)
            loginMessage = "Login successful! You are registered."
            isFirstLogin = false
        } else if username == savedUsername && password == hardcodedPassword {
            // Returning user with correct username and password
            lastLoginDate = Date()
            UserDefaults.standard.set(lastLoginDate!, forKey: lastLoginDateKey)
            loginMessage = "Login successful!"
            isFirstLogin = false
        } else {
            // Incorrect credentials
            loginMessage = "Incorrect username or password."
        }
    }

    private func loadUserDefaults() {
        username = UserDefaults.standard.string(forKey: savedUsernameKey) ?? ""
        if let date = UserDefaults.standard.object(forKey: lastLoginDateKey) as? Date {
            lastLoginDate = date
            isFirstLogin = false
        }
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }

    private func timeElapsed(since date: Date) -> String {
        let elapsed = Date().timeIntervalSince(date)
        let days = Int(elapsed / (24 * 3600))
        let hours = Int((elapsed.truncatingRemainder(dividingBy: 86400)) / 3600)
        let minutes = Int((elapsed.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(elapsed.truncatingRemainder(dividingBy: 60))

        var components: [String] = []
        if days > 0 { components.append("\(days) days") }
        if hours > 0 { components.append("\(hours) hours") }
        if minutes > 0 { components.append("\(minutes) minutes") }
        if seconds > 0 { components.append("\(seconds) seconds") }

        return components.joined(separator: ", ")
    }}

 
#Preview {
    ContentView()
}
