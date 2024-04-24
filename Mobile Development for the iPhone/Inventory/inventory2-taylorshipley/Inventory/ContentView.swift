
//
//  ContentView.swift
//  Inventory
//
//  Created by Taylor Shipley on 6/30/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inventoryItems: [InventoryItem] = []
    @State private var isAddingItem = false
    @Environment(\.scenePhase) var scenePhase
    
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
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                self.inventoryItems = DBManager.shared.queryAllItems()
            case .background:
                DBManager.shared.deleteAllItems()
                for item in self.inventoryItems {
                    DBManager.shared.insert(inventoryItem: item)
                }
            default:
                break
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

