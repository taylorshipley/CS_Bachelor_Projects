//
//  DetailsView.swift
//  Inventory
//
//  Created by Taylor Shipley on 6/30/23.
//

import SwiftUI

struct InventoryItem: Identifiable{
    let id = UUID()
    var shortDescription: String
    var longDescription: String
}

struct DetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding private var inventoryItem: InventoryItem
    @State private var newShortDescription: String
    @State private var newLongDescription: String
    
    init(inventoryItem: Binding<InventoryItem>) {
            _inventoryItem = inventoryItem
            _newShortDescription = State(initialValue: inventoryItem.wrappedValue.shortDescription)
            _newLongDescription = State(initialValue: inventoryItem.wrappedValue.longDescription)
        }
    var body: some View {
        VStack {
            HStack {
                Text("Short: ")
                TextField("", text: $newShortDescription)
                    .accessibilityLabel("editShortDescription")
                    .accessibilityValue(newShortDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Text("Long: ")
                TextField("", text: $newLongDescription)
                    .accessibilityLabel("editLongDescription")
                    .accessibilityValue(newLongDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Spacer()
        }
        .padding([.top, .leading, .trailing], 15.0)
        .navigationBarTitle("Edit Item", displayMode: .inline)
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
                    inventoryItem.shortDescription = newShortDescription
                    inventoryItem.longDescription = newLongDescription
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            }
        }
    }
}



struct DetailsView_Previews: PreviewProvider {
    @State static var item = InventoryItem(shortDescription: "", longDescription: "")
    static var previews: some View {
        NavigationView{
            DetailsView(inventoryItem: $item)
        }
    }
}
