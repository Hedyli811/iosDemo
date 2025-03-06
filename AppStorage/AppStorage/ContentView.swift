//
//  ContentView.swift
//  AppStorage
//
//  Created by LI, Hedy on 2025-03-05.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("notificationEnabled") private var notificationEnabled:Bool = false
    
    var body: some View {
        VStack {
            Form{
                Section("User Information"){
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $username)
                        .textContentType(.name)
                        .autocapitalization(.words)
                        .padding(5)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(8)
                    
                }
                Section("Preference") {
                    Toggle( isOn: $notificationEnabled) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Label")/*@END_MENU_TOKEN@*/
                    }
                }
                Section {
                    if username.isEmpty{
                        Text("welcome guest")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                    }else{
                        Text("Hello")
                    }
                    Text("notification are ")
                }
                .navigationTitle("Settings")
               

            }.navigationTitle("Settings")
                .formStyle(.grouped)
                .padding(.top,5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
