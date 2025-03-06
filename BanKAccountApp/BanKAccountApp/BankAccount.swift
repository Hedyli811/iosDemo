
import Foundation

enum BankAccountError: Error {
    case insufficientFunds(amountNeeded: Double)
    case invalidDepositAmount
}

class BankAccount:ObservableObject {

  //properties with default values

  

    @Published var accountNum: Int = 123456789

    @Published var accountOpenDate: Date? = Date()

    @Published var currentAccountType: String = "Chequing"

    @Published var chequingBalance: Double = 1000.0
    @Published var savingBalance: Double = 1000.0
    
    var accountBalance: Double {
          return currentAccountType == "Chequing" ? chequingBalance : savingBalance
      }

   
    func deposit(amt: Double) throws {
          guard amt > 0 else { throw BankAccountError.invalidDepositAmount }
          
          if currentAccountType == "Chequing" {
              chequingBalance += amt
          } else {
              savingBalance += amt
          }
      }

      func withdraw(amt: Double) throws {
          guard amt > 0 else { throw BankAccountError.invalidDepositAmount }
          
          if currentAccountType == "Chequing" {
              guard chequingBalance >= amt else {
                  let needed =  amt - chequingBalance
                  throw BankAccountError.insufficientFunds(amountNeeded: needed) }
              chequingBalance -= amt
          } else {
              guard savingBalance >= amt else {
                  let needed = amt - savingBalance
                  throw BankAccountError.insufficientFunds(amountNeeded: needed) }
              savingBalance -= amt
          }
      }
  
 

}
