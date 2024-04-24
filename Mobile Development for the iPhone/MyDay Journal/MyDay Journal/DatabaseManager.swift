//
//  DatabaseManager.swift
//  MyDay Journal
//
//  Created by Taylor Shipley on 8/1/23.
//

import SQLite3
import Foundation

class DatabaseManager {
    // Create a shared instance (singleton) of the DatabaseManager.
    static let shared = DatabaseManager()
    var db: OpaquePointer?

    // Private initializer to prevent direct instance creation.
    private init() {
        // Create the database file and open the connection.
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("MyDayJournal.sqlite")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
        }

        // Create the "Entry" table if it does not exist.
        let createTableString = """
        CREATE TABLE IF NOT EXISTS Entry (
        id INTEGER PRIMARY KEY,
        title TEXT,
        body TEXT,
        date TEXT,
        mood TEXT);
        """
        if sqlite3_exec(db, createTableString, nil, nil, nil) != SQLITE_OK {
            print("Error creating table")
        }
    }

    // Function to insert a new entry into the "Entry" table.
    func insert(entry: Entry) {
        // Prepare the INSERT statement.
        let insertStatementString = "INSERT INTO Entry (id, title, body, date, mood) VALUES (?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            // Bind values to the statement placeholders.
            sqlite3_bind_int(insertStatement, 1, Int32(entry.id))
            sqlite3_bind_text(insertStatement, 2, (entry.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (entry.body as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (entry.date.description as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, (entry.mood as NSString).utf8String, -1, nil)
            
            
            // Execute the statement.
            if sqlite3_step(insertStatement) != SQLITE_DONE {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }

    func update(entry: Entry) {
        // Prepare the UPDATE statement.
        let updateStatementString = "UPDATE Entry SET title = ?, body = ?, date = ?, mood = ? WHERE id = ?;"
        var updateStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            // Bind values to the statement placeholders.
            if sqlite3_bind_text(updateStatement, 1, (entry.title as NSString).utf8String, -1, nil) != SQLITE_OK {
                print("Binding title failed")
            }
            if sqlite3_bind_text(updateStatement, 2, (entry.body as NSString).utf8String, -1, nil) != SQLITE_OK {
                print("Binding body failed")
            }
            if sqlite3_bind_text(updateStatement, 3, (entry.date.description as NSString).utf8String, -1, nil) != SQLITE_OK {
                print("Binding date failed")
            }
            if sqlite3_bind_text(updateStatement, 4, (entry.mood as NSString).utf8String, -1, nil) != SQLITE_OK {
                print("Binding mood failed")
            }
            if sqlite3_bind_int(updateStatement, 5, Int32(entry.id)) != SQLITE_OK {
                print("Binding id failed")
            }

            // Execute the statement.
            let result = sqlite3_step(updateStatement)
            if result != SQLITE_DONE {
                print("Could not update row. Error code: \(result), Message: \(String(cString: sqlite3_errmsg(db)))")
            }
        } else {
            print("UPDATE statement could not be prepared.")
        }
        sqlite3_finalize(updateStatement)
    }

    // Function to delete an entry from the "Entry" table based on its ID.
    func deleteEntry(id: Int) {
        let deleteStatementString = "DELETE FROM Entry WHERE id = \(id);"
        var deleteStatement: OpaquePointer? = nil

        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            // Execute the DELETE statement.
            if sqlite3_step(deleteStatement) != SQLITE_DONE {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared. Error: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(deleteStatement)
    }

    // Function to query all entries from the "Entry" table and return them as an array of Entry objects.
    func queryAllEntries() -> [Entry] {
        let queryStatementString = "SELECT * FROM Entry;"
        var queryStatement: OpaquePointer? = nil
        var entries: [Entry] = []

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            // Fetch rows one by one from the result set and create Entry objects.
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = Int(sqlite3_column_int(queryStatement, 0))
                let title = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let body = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let dateStr = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let mood = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))

                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: dateStr) ?? Date()

                entries.append(Entry(id: id, title: title, body: body, date: date, mood: mood))
            }
        } else {
            print("SELECT statement could not be prepared.")
        }
        sqlite3_finalize(queryStatement)
        return entries
    }
}
