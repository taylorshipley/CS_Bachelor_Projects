//
//  ContentView.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import SwiftUI

// This struct represents the main content view of the app.
// It displays a list of journal entries and allows adding new entries.
// Each entry can be tapped to view its details.
struct ContentView: View {
    // State properties to manage the list of entries and the new entry view presentation.
    @State private var entries: [Entry] = []
    @State private var isShowingNewEntryView = false
    
    // Environment property to observe changes in the app's lifecycle.
    @Environment(\.scenePhase) var scenePhase

    // DateFormatter to display dates in a user-friendly format.
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            List {
                // Iterate through each entry in the 'entries' array and create a list row for it.
                ForEach(entries.indices, id: \.self) { index in
                    NavigationLink(destination: EntryDetailView(entry: $entries[index])) {
                        VStack {
                            Text(entries[index].title) // Display the title of the entry.
                            Text(dateFormatter.string(from: entries[index].date)) // Display the formatted date of the entry.
                        }
                    }
                }
                // Enable swipe-to-delete functionality for the list rows.
                .onDelete { indexSet in
                    for index in indexSet {
                        DatabaseManager.shared.deleteEntry(id: entries[index].id) // Delete the entry from the database.
                    }
                    entries.remove(atOffsets: indexSet) // Remove the entry from the local 'entries' array.
                }
            }
            .navigationBarTitle("Entries", displayMode: .inline) // Set the title of the navigation bar.
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isShowingNewEntryView = true }) {
                        Text("New Entry") // Display a button to add a new entry.
                    }
                }
            }
        }
        // Update the 'entries' array whenever the app becomes active.
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                self.entries = DatabaseManager.shared.queryAllEntries() // Query all entries from the database.
            default:
                break
            }
        }
        // Show a sheet to add a new entry when 'isShowingNewEntryView' is true.
        .sheet(isPresented: $isShowingNewEntryView) {
            NewEntryView(title: "", entryBody: "", date: Date(), mood: "", onAdd: { newEntry in
                DatabaseManager.shared.insert(entry: newEntry) // Insert the new entry into the database.
                self.entries.append(newEntry) // Add the new entry to the 'entries' array.
                self.isShowingNewEntryView = false // Dismiss the new entry view.
            })
        }

    }
}

// A preview provider to generate previews of the ContentView.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
