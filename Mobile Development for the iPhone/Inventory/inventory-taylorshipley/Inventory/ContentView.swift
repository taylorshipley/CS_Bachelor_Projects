
//
//  ContentView.swift
//  Inventory
//
//  Created by Taylor Shipley on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inventoryItems: [InventoryItem] = [
    ]
    @State private var isAddingItem = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach($inventoryItems) { $item in
                        NavigationLink(destination: DetailsView(inventoryItem: $item)) {
                            VStack {
                                Text(item.shortDescription)
                                .accessibilityLabel(item.shortDescription)
                                .accessibilityIdentifier(item.shortDescription)
                            .accessibilityValue(item.shortDescription)
                                Text(item.longDescription)
                                .accessibilityLabel(item.longDescription)
                                .accessibilityIdentifier(item.longDescription)
                            .accessibilityValue(item.longDescription)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        inventoryItems.remove(atOffsets: indexSet)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Inventory", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddItemView(inventoryItems: $inventoryItems)) {
                        Text("Add")
                    }
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

