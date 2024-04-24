//
//  EntryDetailView.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import SwiftUI

struct EntryDetailView: View {
    @Binding var entry: Entry

    var body: some View {
        Form {
            Section(header: Text("Title")) {
                Text(entry.title)
            }

            Section(header: Text("Date")) {
                Text("\(entry.date, formatter: dateFormatter)")
            }

            Section(header: Text("Mood")) {
                Text(entry.mood)
            }

            Section(header: Text("Entry")) {
                HStack {
                    Text(entry.body)
                    Spacer()
                }
                .frame(height: 350, alignment: .topLeading)
            }
        }
        .navigationBarTitle("Entry Details", displayMode: .inline)
        .navigationBarItems(trailing: NavigationLink(destination: EditEntryView(entry: $entry)) {
            Text("Edit")
        })
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }
}

//FIXME: Make entry scrollable
struct EntryDetailView_Previews: PreviewProvider {
    @ State static var entry = Entry(id: Int.random(in: 1..<100), title: "Preview Title", body: "Preview Body", date: Date(), mood: "Preview Mood")

    static var previews: some View {
        EntryDetailView(entry: $entry)
    }
}
