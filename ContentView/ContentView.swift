//
//  ContentView.swift
//  ContentView
//
//  Created by LI, Hedy on 2025-01-28.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var greeting :String = ""
    var body: some View {
        ZStack{
            Color(red: 1, green: 0.9, blue: 1)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("Say Hello")
                    .font(.title)
                
                TextField( "Enter your name",text:$name ).multilineTextAlignment(.center)
                
                
                Button(action:{
                    greeting =  "Hello \(name)"
                }){
                    Text("Display")
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(10)
                
                Text(greeting)
            }
            .padding()
                    }
    }
}

#Preview {
    ContentView()
}
