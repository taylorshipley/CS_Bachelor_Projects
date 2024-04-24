//
//  NewEntryView.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import SwiftUI

struct NewEntryView: View {
    @State var title: String
    @State var entryBody: String
    @State var date: Date
    @State var mood: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var onAdd: (Entry) -> Void

    @State private var showAlert = false

    // Determine if the form can be saved based on whether all required fields are filled.
    private var canSave: Bool {
        !title.isEmpty && !entryBody.isEmpty && !mood.isEmpty
    }

    var body: some View {
        NavigationView {
            Form {
                // Section to input the title of the new entry.
                Section(header: Text("Title")) {
                    TextField("", text: $title)
                }

                // Section to select the date of the new entry.
                Section(header: Text("Date")) {
                    DatePicker("", selection: $date, displayedComponents: .date)
                }

                // Section to input the mood of the new entry.
                Section(header: Text("Mood")) {
                    TextField("", text: $mood)
                }

                // Section to input the body of the new entry.
                Section(header: Text("Entry")) {
                    TextEditor(text: $entryBody)
                        .frame(height: 350, alignment: .topLeading)
                }
            }
            // Navigation bar items (Save and Cancel buttons).
            .navigationBarItems(
                // Cancel button to dismiss the new entry view without saving changes.
                leading: Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                },
                // Save button to save the new entry if all required fields are filled.
                trailing: Button(action: {
                    if canSave {
                        let newEntry = Entry(id: Int.random(in: 1..<100), title: title, body: entryBody, date: date, mood: mood)
                        onAdd(newEntry) // Call the 'onAdd' closure to add the new entry to the list.
                    } else {
                        showAlert = true // Show an alert if not all fields are filled out.
                    }
                }) {
                    Text("Save")
                }.alert(isPresented: $showAlert) {
                    // Alert to inform the user that all fields must be filled out.
                    Alert(title: Text("Invalid Entry"), message: Text("All fields must be filled out."), dismissButton: .default(Text("OK")))
                }
            )
        }
    }
}

struct NewEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NewEntryView(title: "Preview Title",
                     entryBody: "Preview Body",
                     date: Date(),
                     mood: "Preview Mood",
                     onAdd: { _ in })
    }
}
