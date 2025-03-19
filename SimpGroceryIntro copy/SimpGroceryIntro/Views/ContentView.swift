//
//  ContentView.swift
//  SimpGroceryIntro
//
//  Created by LI, Hedy on 2025-03-10.
//

import SwiftUI
import SwiftData
struct ContentView: View {
   
   @Environment(\.modelContext) var modelContext
   
   @Query(sort: [SortDescriptor<GroceryItem>(\.name, order: .forward)]) private
var items: [GroceryItem]
   @State private var newItemName : String = ""
   @State private var errorMessage : String  = ""
   
   var body: some View {
       
       ZStack{
           
           Color(Color.backgroundDark)
               .ignoresSafeArea()
           
           VStack(alignment: .center) {
               ZStack{
                  
                   Text("Grocery List".uppercased())
                       .foregroundColor(Color.textGold)
                       .font(.largeTitle)
                       .fontWeight(.bold)
               }
               
               Section{
                   VStack(alignment: .leading){
                       Text("Make Your List".uppercased())
                           .foregroundColor(Color.textGold)
                           .fontWeight(.bold)
                           .padding(.top,20)
                           .padding(.leading,25)
                       
                       VStack{
                           TextField("Enter Item", text: $newItemName)
                               .textFieldStyle(.roundedBorder)
                           
                           Button("Save Item"){
                               addItem()
                           }
                           .frame(maxWidth: .infinity, maxHeight: 30)
                           .background(Color.buttonRed)
                           .foregroundColor(Color.textGold)
                           .fontWeight(.bold)
                           .buttonStyle(.bordered)
                           .cornerRadius(10)
                           
                       }.padding()
                       
                       Text("What's Needed".uppercased())
                           .foregroundColor(Color.textGold)
                           .fontWeight(.bold)
                           .padding(.leading,25)
                       
                       List{
                           ForEach(items){ item in
                               HStack{
                               Text(item.name)
                                   .foregroundColor(Color.buttonRed)
                                   .fontWeight(.bold)
                                   .listRowBackground(Color.listItemBackground)
                                   Spacer()
                               Toggle("", isOn: Binding(
                                   get: { item.obtained },
                                   set:{newValue in
                                       do{
                                           item.obtained = newValue
                                           try modelContext.save()
                                       }catch{
                                           errorMessage = "Failed to save toggle change: \(error.localizedDescription)"
                                           
                                       }
                                   }
                               )).labelsHidden()
                               
                           }.listRowBackground(Color.listItemBackground)
                               
                           }.onDelete(perform: deleteItems)
                       }
                       .scrollContentBackground(.hidden)
                       .contentMargins(.top, 0)
                   }
                  // .padding(25)
              
               }
               
               .background(Color.sectionBackground)
               .cornerRadius(20)
               .padding(25)
   
           }
           
       }
       
       
   }
   
   private func addItem(){
       guard !newItemName.isEmpty else{return}
       let newItem = GroceryItem(name:newItemName)
       modelContext.insert(newItem)
        try? modelContext.save()
       newItemName = ""
   }
   private func deleteItems(at offsets: IndexSet){
       for index in offsets{
           modelContext.delete(items[index])
       }
   }
}
#Preview {
   ContentView().modelContainer(for:GroceryItem.self,inMemory: true)
}
