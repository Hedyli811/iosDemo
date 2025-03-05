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
    @State private var message: String = ""
    @State private var lastLogin: String = ""
    
    
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
             let theName = UserDefaults.standard.object(forKey: "username")
            
            if(theName == nil){
                UserDefaults.standard.set(username, forKey: "username")
            }
            else{
                if(password == "secret" ){
                    message = ""
                }else{
                    message = "wrong credential"
                }
            }
           
            let now = Date()
            var datefrmt = DateFormatter()
            datefrmt.dateStyle = .medium
            lastLogin = datefrmt.string(from: now)
             

        }
        Text(lastLogin)
    }
}



#Preview {
    ContentView()
}
