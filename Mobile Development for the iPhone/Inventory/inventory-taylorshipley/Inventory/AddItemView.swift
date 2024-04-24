//
//  AddItemView.swift
//  Inventory
//
//  Created by Taylor Shipley on 7/1/23.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var inventoryItems: [InventoryItem]
    @State private var newShortDescription = ""
    @State private var newLongDescription = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Short:")
                TextField("", text: $newShortDescription)
                    .accessibilityLabel("addShortDescription")
                    .accessibilityValue(newShortDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
            }
            .padding(.horizontal)
            
            HStack {
                Text("Long:")
                TextField("", text: $newLongDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityLabel("addLongDescription")
                    .accessibilityValue(newLongDescription)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .navigationBarTitle("Add New Item", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    let newItem = InventoryItem(shortDescription: newShortDescription, longDescription: newLongDescription)
                    inventoryItems.append(newItem)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            }
        }
    }
}



struct AddItemView_Previews: PreviewProvider {
    @State static var inventoryItems: [InventoryItem] = []
    
    static var previews: some View {
        NavigationView {
            AddItemView(inventoryItems: $inventoryItems)
        }
    }
}

