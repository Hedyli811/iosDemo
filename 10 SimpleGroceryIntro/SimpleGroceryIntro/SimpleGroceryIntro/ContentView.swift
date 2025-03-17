//
//  ContentView.swift
//  SimpleGroceryIntro
//
//  Created by FERDAUSI, SHARMIN SHAMS on 2025-03-10.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //environment var for model context
    @Environment(\.modelContext) var modelContext
    @Query private var items : [GroceryItem]
    
    @State private var newItemName = ""
    var body: some View {
        NavigationStack{
        VStack {
            HStack{
                TextField("Enter Item ", text : $newItemName)
                Button("Add"){
                    //call addItem
                    addItem()
                    
                       
                }
            }
         
        }
        .padding()
            
            List{
                ForEach(items){  item in
                     Text(item.name)
                }.onDelete(perform: deleteItems)
            }
            .navigationTitle("Grocery List")
        }
        
       
 }
    private func addItem(){
        
        guard !newItemName.isEmpty else {return}
        let newItem = GroceryItem(name: newItemName)
        modelContext.insert(newItem)
        newItemName = ""
        
    }
    
    private func deleteItems(at offsets : IndexSet){
        for index in offsets{
            modelContext.delete(items[index])
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for : GroceryItem.self, inMemory: true)
}
