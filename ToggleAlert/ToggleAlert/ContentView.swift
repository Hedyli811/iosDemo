//
//  ContentView.swift
//  ToggleAlert
//
//  Created by LI, Hedy on 2025-01-29.
//

import SwiftUI

struct ContentView: View {
    @State private var isEnabled = false
    @State private var showSuccess = false
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Toggle(isOn:$isEnabled ){
                Text("Enable Feature")
            }
            .padding()
            .onChange(of:isEnabled) { newValue in
                if !newValue {
                    showSuccess = false
                }
            }
            
            Button("Perform Action"){
                if isEnabled {
                    showSuccess = true
                }else{
                    showAlert = true
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .alert("The feature must be enabled to proceed", isPresented: $showAlert){
                Button("OK",role:.cancel){}
            }
            Text(showSuccess ? "Success" : "")
                .foregroundColor(.green)
          
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
