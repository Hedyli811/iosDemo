//
//  ContentView.swift
//  LogIn
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-03-04.
//
// We worked together to finish the team activity.

import SwiftUI

struct ContentView: View {
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var message : String = ""
    @State private var lastLogin : Date? = nil
    @State private var lastLoginMessage : String = ""
    @State private var lastLoginDate : String = ""
    private let storePassword = "Secret"
    
    var body: some View {
        
        
        VStack {
            Image("OrganicallyYoursSm")
                .imageScale(.large)
                .foregroundStyle(.tint)
        Text("Welcome! Please Log In").font(.title)
                .padding()
            
            TextField("Enter Username",text :$username).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            SecureField("Enter Password",text :$password).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
        Button("Login"){
            
            handleLogin()
                
            }.padding()
            Text(message)
            Text(lastLoginMessage).multilineTextAlignment(.center)
    
            }
        .padding()
        Spacer()
            .onAppear{
                loadUserData()
            }
    }
    func saveLastLoginDate(){
        let currentDate = Date ()
        let datefrmt = DateFormatter()
        datefrmt.dateStyle = .medium
        
        UserDefaults.standard.set(currentDate, forKey: "lastLoginDateKey")
        
        lastLoginDate = (datefrmt.string(from: lastLogin ?? Date()));
       
        let timeInterval = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: lastLogin ?? Date() , to: currentDate)
        lastLoginMessage = " \(lastLoginDate) \n Your last login was \(timeInterval.day ?? 0) days \(timeInterval.hour ?? 0) hours \(timeInterval.minute ?? 0) minutes \(timeInterval.second ?? 0) seconds ago "
        lastLogin = currentDate
        
    }
    
    func loadUserData(){
        if let storedUserName = UserDefaults.standard.object(forKey: "savedUsernameKey"){
            username = (storedUserName as? String)!
        }
        
        lastLogin = UserDefaults.standard.object(forKey: "lastLoginDateKey") as? Date
    }
    func handleLogin(){
        clearData()
        let datefrmt = DateFormatter()
        datefrmt.dateStyle = .medium
//        UserDefaults.standard.removeObject(forKey: "savedUsernameKey")
        
        if(username.isEmpty || password.isEmpty){
            message = "Username and password required"
            return
        }
        
        let storedUserName  = UserDefaults.standard.object(forKey: "savedUsernameKey")
       
        if storedUserName == nil {
            
            UserDefaults.standard.set(username, forKey: "savedUsernameKey")
            
            message = "Username is saved. Login is successful"
            
            return
        }
     
        if username == storedUserName as? String  {
            if password == storePassword{
                message = "Successful login "
                saveLastLoginDate()
                
            } else{
                message = "invalid"
            }
        }
           
        }
    func clearData(){
        
        lastLoginDate = ""
        lastLoginMessage = ""
    }
    
}

#Preview {
    ContentView()
}
