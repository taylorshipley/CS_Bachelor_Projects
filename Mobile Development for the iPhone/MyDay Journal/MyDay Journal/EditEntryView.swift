//
//  EditEntryView.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import SwiftUI

struct EditEntryView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var entry: Entry
    @State private var editableEntry: Entry

    init(entry: Binding<Entry>) {
            self._entry = entry
            self._editableEntry = State(initialValue: entry.wrappedValue)
        }
    
    var body: some View {
        Form {
            Section(header: Text("TITLE")) {
                TextField("", text: $editableEntry.title) // Text field to edit the title.
            }

            Section(header: Text("DATE")) {
                DatePicker("", selection: $editableEntry.date, displayedComponents: .date) // Date picker to edit the date.
            }

            Section(header: Text("MOOD")) {
                TextField("", text: $editableEntry.mood) // Text field to edit the mood.
            }

            Section(header: Text("ENTRY")) {
                HStack {
                    TextEditor(text: $editableEntry.body) // Text editor to edit the entry body.
                    Spacer()
                }
                .frame(height: 350, alignment: .topLeading)
            }
        }
        // Navigation bar configuration.
        .navigationBarTitle("Edit Entry", displayMode: .inline) // Set the title of the navigation bar.
        .navigationBarBackButtonHidden(true) // Hide the default back button.
        .toolbar {
            // Add Cancel button to dismiss the view without saving changes.
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
            }

            // Add Save button to save the updated entry.
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    saveEntry() // Call the saveEntry function to update the entry.
                }) {
                    Text("Save")
                }
            }
        }
    }

    // Function to save the updated entry.
    private func saveEntry() {
            entry = editableEntry // Copy the changes from editableEntry to the original entry
            DatabaseManager.shared.update(entry: entry) // Update the entry in the database
            presentationMode.wrappedValue.dismiss() // Dismiss the view
        }
}

struct EditEntryView_Previews: PreviewProvider {
    @State static var entry = Entry(id: Int.random(in: 1..<100), title: "Preview Title", body: "Preview Body", date: Date(), mood: "Preview Mood")

    static var previews: some View {
        EditEntryView(entry: $entry)
    }
}

