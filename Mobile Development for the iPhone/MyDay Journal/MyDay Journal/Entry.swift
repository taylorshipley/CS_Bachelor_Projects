//
//  Entry.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import Foundation

// This struct represents a journal entry with its properties.
struct Entry: Identifiable {
    var id: Int // Unique identifier for the entry.
    var title: String // Title of the entry.
    var body: String // Body content of the entry.
    var date: Date // Date of the entry.
    var mood: String // Mood associated with the entry.
}
