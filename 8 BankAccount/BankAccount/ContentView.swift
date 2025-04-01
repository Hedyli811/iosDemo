//
//  ContentView.swift
//  BankAccount
//
//  Created by LI, Hedy on 2025-03-26.
//


import SwiftUI




struct ContentView: View {
   
   @ObservedObject var bankAccount = BankAccount()
   
   @State private var amount: String = ""
   @State private var showingAlert = false
   @State private var alertMessage:String  = ""
   @State private var accountTypeInput:String = "Chequing"
   
   @State private var selection = "Chequing"
   let options = ["Chequing", "Saving" ]
   
   var body: some View {
       VStack {
            Text("Simple Bank App")
               .font(.largeTitle)
               .fontWeight(.bold)
           Image(systemName: "dollarsign.square.fill")
               .resizable()
               .frame(width: 100,height: 100)
           
           Form{
               Section(header:Text("Account Details")){
                   HStack{
                       VStack(alignment: .leading ){
                           Label("Account Number\(bankAccount.accountNum)",systemImage: "number.circle")
                           Picker("Account Type", selection: $selection) {
                               ForEach(options, id: \.self) {
                                   type in
                                   Text(type)
                               }
                           }
                           .padding()
                           .onChange(of: selection) {
                               newValue in bankAccount.currentAccountType = newValue
                           }
                           Label("Account Balance:\(bankAccount.accountBalance,specifier: "%.2f")" ,systemImage: "dollarsign.circle")
                       }
                   }
                   .frame(maxWidth: .infinity, alignment: .leading)
               }
               Section(header: Text("TRANSACTION") ){
                   
                   TextField("Amount",text:$amount)
                       .textFieldStyle(RoundedBorderTextFieldStyle())
                       .keyboardType(.decimalPad)
                   
                   HStack{
                       Button("Deposit"){
                           performDeposit()
                       }
                       .buttonStyle(.bordered)
                    
                       Button("Withdraw"){
                           performWithdraw()
                       }
                       .buttonStyle(.bordered)
                     
                       
                   }
                   .frame(maxWidth:.infinity,
                          alignment: .center)
               }
           }
           
           .alert(isPresented: $showingAlert){
               Alert(title: Text("Error"),message: Text(alertMessage),dismissButton: .default(Text("OK")))
           }
           
           
       }
       .padding()
   }
   
   func performDeposit(){
       if let depositAmt = Double(amount){
           do{
               try bankAccount.deposit(amt: depositAmt)
               amount = ""
           }catch BankAccountError.invalidDepositAmount {
               alertMessage = "invalid deposit amount"
               showingAlert = true
           }catch{
               alertMessage = "An unexpected error occurred"
               showingAlert = true
           }
       }else{
           alertMessage = "Please enter a valid amount"
           showingAlert = true
       }
   }
   
   func performWithdraw(){
       if let depositAmt = Double(amount){
           do{
               try bankAccount.withdraw(amt: depositAmt)
               amount = ""
           }catch BankAccountError.invalidDepositAmount {
               alertMessage = "invalid withdraw amount"
               showingAlert = true
           }catch{
               alertMessage = "An unexpected error occurred"
               showingAlert = true
           }
       }else{
           alertMessage = "Please enter a valid amount"
           showingAlert = true
       }
       
   }}

#Preview {
   ContentView()
}
