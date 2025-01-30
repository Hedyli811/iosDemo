//
//  ContentView.swift
//  Toggle
//
//  Created by LI, Hedy on 2025-01-29.
//

import SwiftUI

struct ContentView: View {
    @State private var isDarkMode = false
    @State private var msg = "light mode enabled"
    
    var body: some View {
        ZStack{
            Color(isDarkMode ? Color.black : Color.white)
                .ignoresSafeArea()
            
            VStack {
                Toggle(isOn: $isDarkMode){
                    Text(isDarkMode ? "enable dark mode" : "back to white mode")
                        .foregroundColor(isDarkMode ? Color.white : Color.black  )
                }
                .padding()
               
                .onChange(of: isDarkMode){ value in
                    msg = value ? "black mode" : "white mode"
                }
                
                Text(msg)
                    .foregroundColor(isDarkMode ? Color.white : Color.black
                    )
                    
            }.padding()
            
                  }
    }
}

#Preview {
    ContentView()
}
