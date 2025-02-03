//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by LI, Hedy on 2025-02-03.
//

import SwiftUI

enum ExchangeRate : Double{
    case bank = 1.34
    case paypal = 1.36
    
    var label:String{
        switch self{
        case .bank:
            return "Bank Rate - $1.34"
        case .paypal:
            return "Paypal Rate - $1.36"
        }
    }
}

enum CurrencyConverterError:Error{
    case invalidInput
    case formattingError
    
    var errorDescription: String?{
        switch self{
        case .invalidInput:
            return "Invalid input"
        case .formattingError:
            return "Error farmatting total"
        }
    }
}

struct ContentView: View {
    @State private var amountUSD: String = ""
    @State private var selectedRate = ExchangeRate.bank
    @State private var convertedAmount:String = ""
    @State private var showAlert:Bool = false
    @State private var alertMessage:String  = ""
    
    let currencyFormatter : NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_CA")
        return formatter
    }()
    
    func convertCurrency(){
        guard let usd = Double(amountUSD) else{
            handleConversionError(.invalidInput)
            return
        }
        
        let cad = usd * selectedRate.rawValue
        
        guard let formattedTotal = currencyFormatter.string(from: NSNumber(value: cad)) else{
            handleConversionError(.formattingError)
            return
        }
        
        convertedAmount = formattedTotal
                
    }
    
    private func handleConversionError(_ error: CurrencyConverterError){
        alertMessage = error.localizedDescription
        showAlert = true
    }
    var body: some View {
        ZStack{
            Color.blue.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    hideKeyboard()
                }
            VStack ( ){
                
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .padding()
                
                Text("USD to CAD Converter")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Form{
                    Section(header: Text("Enter amount in us dollors")){
                        TextField(" Amount in USD",text: $amountUSD)
                            .multilineTextAlignment(.center)
                            .keyboardType(.decimalPad)
                    }
                    
                    Section("SELECT EXCHANGE RATE"){
                        
                        Picker("Select Exchange Rate",selection: $selectedRate){
                            Text(ExchangeRate.bank.label)
                                .tag(ExchangeRate.bank)
                            Text(ExchangeRate.paypal.label)
                                .tag(ExchangeRate.paypal)
                            
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                        
                    }
                    Section(header:Text("CONVERTED AMOUNT IN CAD")){
                        Text(convertedAmount.isEmpty ? "$0.00" : convertedAmount)
                            .font(.title)
                            .frame(maxWidth: .infinity,
                                   alignment:.center)
                    }
                    
                }
                .padding()
                
                Button("Convert"){
                    convertCurrency()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
        }
        .alert(isPresented: $showAlert ){
            Alert(title: Text("Error"),message: Text(alertMessage),dismissButton: .default(Text("OK")))
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
    }
}

