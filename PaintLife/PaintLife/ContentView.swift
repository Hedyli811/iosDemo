//
//  ContentView.swift
//  PaintLife
//
//  Created by LI, Hedy on 2025-02-11.
//

import SwiftUI

 
enum CurrencyConverterError:Error{
    case invalidInput
    case formattingError
    
    var errorDescription: String{
        switch self{
        case .invalidInput:
            return "Please enter valid numbers."
        case .formattingError:
            return "Error farmatting total"
        }
    }
}

struct ContentView: View {
        @State private var width: String = ""
        @State private var length: String = ""
        @State private var height: String = ""
    
        @State private var outputString:String = ""
   
        
        let currencyFormatter : NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "en_CA")
            return formatter
        }()
        
        func calculate(){
            guard let width = Double(width) else{
                handleConversionError(.invalidInput)
                return
            }
            guard let length = Double(length) else{
                handleConversionError(.invalidInput)
                return
            }
            guard let height = Double(height) else{
                handleConversionError(.invalidInput)
                return
            }
            let area = (2*(width + length))*height
            
            let gallonNeeded = (area / 350).rounded(FloatingPointRoundingRule.up)
            
            
            
            guard let formattedTotal = currencyFormatter.string(from: NSNumber(value: gallonNeeded * 20)) else{
                handleConversionError(.formattingError)
                return
            }
            
            outputString = "Area is: \(area) Sq ft \n Gallons Needed: \(gallonNeeded) \n Total Cose: \(formattedTotal)"
                    
        }
        
        private func handleConversionError(_ error: CurrencyConverterError){
            outputString = error.errorDescription
        }
        var body: some View {
            ZStack{
                Color(red: 1, green: 0.88, blue: 0.88)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        hideKeyboard()
                    }
                VStack ( ){
                    
                    Image(ImageResource.life)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200,height: 200)
                        .padding()
                            TextField(" Enter Length (ft)",text: $length)
                                .background()
                                .padding()
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                       
                            TextField("Enter Width (ft)",text: $width)
                                .background()
                                .padding()    .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                       
                            TextField("Enter Height (ft)",text: $height)
                            .background()
                            .padding()
                                .multilineTextAlignment(.center)
                                .keyboardType(.numberPad)
                       
                            Text(outputString)
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity,
                                alignment:.center)
             
                    .padding()
                    
                    Button("Calculate Paint"){
                        calculate()
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Spacer()
                }
                .padding()
            }
        }
        
}

#Preview {
    ContentView()
}


extension View{
    func hideKeyboard(){
        UIApplication.shared
            .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }}
