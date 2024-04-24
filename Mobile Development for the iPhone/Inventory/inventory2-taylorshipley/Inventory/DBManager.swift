//
//  DBManager.swift
//  Inventory
//
//  Created by Taylor Shipley on 7/22/23.
//
import SQLite3
import Foundation

class DBManager {
    static let shared = DBManager()
    var db: OpaquePointer?
    
    private init() {
        // 1. Create the database file
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("InventoryItems.sqlite")

        // 2. Open the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        // 3. Create the table
        let createTableString = """
        CREATE TABLE IF NOT EXISTS InventoryItem(
        Id TEXT PRIMARY KEY NOT NULL,
        ShortDescription TEXT NOT NULL,
        LongDescription TEXT NOT NULL);
        """
        if sqlite3_exec(db, createTableString, nil, nil, nil) != SQLITE_OK {
            print("error creating table")
        }
    }
    
    func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Inventory.sqlite")
            
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS Inventory(Id INTEGER PRIMARY KEY,shortDescription TEXT,longDescription TEXT);"
        var createTableStatement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Inventory table created.")
            } else {
                print("Inventory table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(inventoryItem: InventoryItem) {
        let insertStatementString = "INSERT INTO InventoryItem (Id, ShortDescription, LongDescription) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            let id: NSString = inventoryItem.id as NSString
            let shortDescription: NSString = inventoryItem.shortDescription as NSString
            let longDescription: NSString = inventoryItem.longDescription as NSString

            sqlite3_bind_text(insertStatement, 1, id.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, shortDescription.utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, longDescription.utf8String, -1, nil)

            if sqlite3_step(insertStatement) != SQLITE_DONE {
                print("\nCould not insert row.")
            } else {
                print("\nSuccessfully inserted row.")
            }
        } else {
            print("\nINSERT statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }

    func deleteAllItems() {
        let deleteStatementString = "DELETE FROM InventoryItem;"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            if sqlite3_step(deleteStatement) != SQLITE_DONE {
                print("\nCould not delete rows.")
            } else {
                print("\nSuccessfully deleted all rows.")
            }
        } else {
            print("\nDELETE statement could not be prepared. Error: \(String(cString: sqlite3_errmsg(db)))")
        }
        sqlite3_finalize(deleteStatement)
    }
        
    func queryAllItems() -> [InventoryItem] {
        let queryStatementString = "SELECT * FROM InventoryItem;"
        var queryStatement: OpaquePointer? = nil
        var items : [InventoryItem] = []

        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let idString = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let shortDescription = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let longDescription = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                
                items.append(InventoryItem(id: idString, shortDescription: shortDescription, longDescription: longDescription))
            }
        } else {
            print("SELECT statement could not be prepared.")
        }
        sqlite3_finalize(queryStatement)
        return items
    }
}
