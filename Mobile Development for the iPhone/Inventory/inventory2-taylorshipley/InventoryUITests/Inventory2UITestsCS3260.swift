//
//  InventoryUITests2CS3260.swift
//  InventoryUITests
//
//  Created by Ted Cowan on 10/13/18.
//  Copyright © 2018 Ted Cowan. All rights reserved.
//
//
//  Note to students: do not modify this file in any way

import XCTest
import SwiftUI

class Inventory2UITestsCS3260: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVerifyLabels2() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(app.navigationBars["Inventory"].exists, "Screen not titled \"Inventory\"")
        XCTAssert(app.navigationBars["Inventory"].buttons["Add"].exists, "Add button not found")
        XCTAssert(app.descendants(matching: .collectionView).count == 1, "No List view found on opening screen")
    }
    
    func testAddItems2() {
        deleteAllTableCells()
        let rand = String(Int.random(in: 0..<1000))
        let sampleItems = [("Item one", "This is item one" + rand),
                           ("Item two", "This is item two" + rand),
                           ("Item three", "This is item three" + rand),
                           ]

        addItems(items: sampleItems, application: app)
    
        deleteAllTableCells()

    }
    
    func testAddEmptyItem2() {
        let emptyItems = [(" ", " "),
                           (" ", " "),
                           (" ", " "),
                           ]
        deleteAllTableCells()

        addItems(items: emptyItems, application: app)
    
        deleteAllTableCells()

    }

    func testEditItem2() {
        let rand = String(Int.random(in: 0..<1000))

        var testItems = [("Item one", "This is item one" + rand),
                           ("Item two", "This is item two" + rand),
                           ("Item three", "This is item three" + rand),
                           ]

        deleteAllTableCells()

        //let tableView = app.tables.element(boundBy: 0)
        
        addItems(items: testItems, application: app)
                
        let buttons = app.buttons
        XCTAssert(buttons.element(boundBy: 2).exists, "Second cell to be deleted not found")
        let button = buttons.element(boundBy: 2)  // the first button is the ADD button
        
        button.forceTapElement()
        XCTAssert(app.navigationBars["Edit Item"].exists, "Screen not titled \"Edit Item\"")
        XCTAssert(app.navigationBars["Edit Item"].buttons["Cancel"].exists, "Inventory Edit Item \"Cancel\" button not found")
        XCTAssert(app.navigationBars["Edit Item"].buttons["Save"].exists, "Save button not found")
        XCTAssert(app.textFields["editShortDescription"].exists, "No textField found with identifier addShortDescription in Edit Item")
        XCTAssert(app.textFields["editLongDescription"].exists, "No textField found with identifier addLongDescription in Edit Item")

        let addedText = " more text added here"
        app.textFields["editShortDescription"].tap()
        usleep(250000)  // now required with iOS 13
        app.textFields["editShortDescription"].tap()
        sleep(3)
        let selectAll = app.menuItems["Select All"].exists
        if selectAll {
            app.menuItems["Select All"].tap()
            app.menuItems["Cut"].tap()
            app.typeTextSlowly(testItems[1].0 + addedText)
            app.textFields["editLongDescription"].tap()
            usleep(250000)  // now required with iOS 13
            app.textFields["editLongDescription"].tap()
            app.menuItems["Select All"].tap()
            app.menuItems["Cut"].tap()
            app.textFields["editLongDescription"].typeTextSlowly(testItems[1].1 + addedText)
            let saveButton = app.navigationBars["Edit Item"].buttons["Save"]
            XCTAssertTrue(saveButton.exists, "No Save button on Navigation bar")
            sleep(2)
            saveButton.tap()
        } else {
            _ = app.navigationBars["Edit Item"].buttons["Cancel"].waitForExistence(timeout: 2)
            app.menuItems.element.tap()  // get rid of the Paste button
            sleep(2)
            app.navigationBars["Edit Item"].buttons["Cancel"].tap()
        }

        let t = app.tables.element(boundBy: 0)

        let cells = t.children(matching: .cell)
        print(cells.debugDescription)
        testItems[1].0 = testItems[1].0 + addedText
        testItems[1].1 = testItems[1].1 + addedText

        // verify list are correct
        verifyList(items: testItems, app: app)
        deleteAllTableCells()

    }
    
    func testDeleteItem2() {
        let rand = String(Int.random(in: 0..<1000))

        var someItems = [("Item one", "This is item one" + rand),
                           ("Item two", "This is item two" + rand),
                           ("Item three", "This is item three" + rand),
                           ]

        deleteAllTableCells()

        //let tableView = app.tables.element(boundBy: 0)
        addItems(items: someItems, application: app)

        let itemToDelete = 1
                
        let cells = app.descendants(matching: .cell)
        var cell = cells.element(boundBy: itemToDelete)
        cell.swipeLeft(velocity: XCUIGestureVelocity.slow)
        //XCTAssert(cell.descendants(matching: .button)["Delete"].exists, "Second cell does not include a Swipe to Delete button")
        cell = cells.element(boundBy: itemToDelete)

        XCTAssert(app.descendants(matching: .button)["Delete"].exists, "Second cell does not include a Swipe to Delete button")
        app.descendants(matching: .button)["Delete"].tap()
        
        someItems.remove(at: itemToDelete)
        
        let rowCount = cells.count
        XCTAssert(rowCount == someItems.count, "After Delete, List should have \(someItems.count) rows, but found \(rowCount)")

        // verify list are correct
        verifyList(items: someItems, app: app)

        deleteAllTableCells()

    }
    
    func testCancelButtonDoesNotSave2() {
        let rand = String(Int.random(in: 0..<1000))

        let oneItem = [("Item one temp", "This is item one temp" + rand)]
        var originalItems: [(String, String)] = []
        let list = app.tables.element(boundBy: 0)
        
        deleteAllTableCells()

        // save original list
        for i in 0..<list.cells.count {
            let cells = list.children(matching: .cell)
            let texts = cells.element(boundBy: i).staticTexts
            let shortDescription = texts["shortDescription"].value as! String
            let longDescription = texts["longDescription"].value as! String

            originalItems.append((shortDescription, longDescription))
        }
        addItems(items: oneItem, application: app, save: false)
        _ = app.navigationBars["Add New Item"].buttons["Cancel"].waitForExistence(timeout: 2)
        app.navigationBars["Add New Item"].buttons["Cancel"].tap()
        
        // verify list did not change if Cancel button hit
        verifyList(items: originalItems, app: app)
        
        // test edit dialog cancel button
        addItems(items: oneItem, application: app, save: true)
        let buttons = app.descendants(matching: .button)
        XCTAssert(buttons.element(boundBy: 1).exists, "First cell to be edited not found")
        let button = buttons.element(boundBy: 1)
        button.forceTapElement()
//        _ = app.navigationBars["Edit Item"].buttons["Cancel"].waitForExistence(timeout: 2)
//        sleep(2)
        app.navigationBars["Edit Item"].buttons["Cancel"].tap()
        sleep(2)
        
        deleteAllTableCells()

    }
    
    func addItems(items:[(String,String)], application:XCUIApplication, save:Bool = true) {
        for i in 0..<items.count {
            sleep(2)
            _ = app.navigationBars["Inventory"].buttons["Add"].waitForExistence(timeout: 2)
            app.navigationBars["Inventory"].buttons["Add"].tap()

            XCTAssert(app.navigationBars["Add New Item"].exists, "Screen not titled \"Add New Item\"")
            XCTAssert(app.navigationBars["Add New Item"].buttons["Cancel"].exists, "Inventory Add New Item button labeded \"Cancel\" not found in Add New Item")
            XCTAssert(app.navigationBars["Add New Item"].buttons["Save"].exists, "Save button not found in Add New Item")
            XCTAssert(app.textFields["addShortDescription"].exists, "No textField found with identifier addShortDescription in Add New Item")
            XCTAssert(app.textFields["addLongDescription"].exists, "No textField found with identifier addLongDescription in Add New Item")
            
            XCTAssert(app.textFields["addShortDescription"].title == "", "addShortDescription is not empty on entry to Add New Item")
            XCTAssert(app.textFields["addLongDescription"].title == "", "addLongDescription is not empty on entry to Add New Item")
            //app.textFields["addShortDescription"].tap()
            //app.textFields["addShortDescription"].typeText(items[i].0)
            UIPasteboard.general.string = items[i].0
            app.textFields["addShortDescription"].tap()
            sleep(1)
            app.textFields["addShortDescription"].doubleTap()
            sleep(1)
            _ = app.menuItems.element(boundBy: 0).waitForExistence(timeout: 3)
            app.menuItems.element(boundBy: 0).tap()


            UIPasteboard.general.string = items[i].1
            app.textFields["addLongDescription"].tap()
            sleep(2)
            app.textFields["addLongDescription"].doubleTap()
            sleep(2)
            _ = app.menuItems.element(boundBy: 0).waitForExistence(timeout: 3)
            app.menuItems.element(boundBy: 0).tap()
            sleep(2)
            if save == true {
                _ = app.navigationBars["Add New Item"].buttons["Save"].waitForExistence(timeout: 2)
                app.navigationBars["Add New Item"].buttons["Save"].tap()
            }

        }
        if save == true {
            verifyList(items: items, app: app)
        }
    }
    
    func testDatabaseIsCorrect2() {
        let rand = String(Int.random(in: 0..<1000))

        let sampleItem = [("Item one", "This is item one" + rand),
                           ]
        // clean out the database
        deleteAllTableCells()
        XCUIDevice.shared.press(.home)
        sleep(2)
        app.terminate()
        app.launch()
        sleep(2)

        addItems(items: sampleItem, application: app, save: true)

        // make sure we are on the list view
        XCTAssert(app.navigationBars["Inventory"].exists, "Screen not titled \"Inventory\"")
        XCTAssert(app.navigationBars["Inventory"].buttons["Add"].exists, "Add button not found")
        
        //XCTAssert(app.tables.element(boundBy: 0).exists, "No List view found on opening screen")

        // Ensure save and load database work from list view
        XCUIDevice.shared.press(.home)
        sleep(2)
        app.terminate()
        app.launch()
        sleep(2)
        verifyList(items: sampleItem, app: app)
                        
        //let tableView = app.tables.element(boundBy: 0)
        let buttons = app.buttons
        XCTAssert(buttons.element(boundBy: 0).exists, "Cell to be edited not found")
        let button = buttons.element(boundBy: 0)
        button.forceTapElement()

        // Ensure save and load database work from edit view
        XCUIDevice.shared.press(.home)
        sleep(2)
        app.terminate()
        app.launch()
        sleep(2)
        verifyList(items: sampleItem, app: app)

        _ = app.navigationBars["Inventory"].buttons["Add"].waitForExistence(timeout: 2)
        app.navigationBars["Inventory"].buttons["Add"].tap()
        
        // Ensure save and load database work from add view
        XCUIDevice.shared.press(.home)
        sleep(2)
        app.terminate()
        app.launch()
        sleep(2)
        verifyList(items: sampleItem, app: app)

        deleteAllTableCells()
    }

    func deleteAllTableCells() {
        //let tableView = app.tables.element(boundBy: 0)
        let cells = app.descendants(matching: .cell)
        for _ in 0..<cells.count {
            print(cells.count)
            let cell = cells.element(boundBy: 0)
            cell.swipeLeft()
            //sleep(1)
            print(app.debugDescription)
            let buttons = app.descendants(matching: .button)
            let deleteButton = buttons["Delete"]
            XCTAssert(deleteButton.exists, "Cell to be deleted does not include a Swipe to Delete button")
            deleteButton.tap()
        }

    }

    func verifyList(items: [(String, String)], app: XCUIApplication) {
    print(app.debugDescription)
    let cells = app.descendants(matching: .cell)

    let rowCount = cells.count
        XCTAssert(rowCount == items.count, "List should have \(items.count) rows, but found \(rowCount)")

        for i in 0..<items.count {
            let cell = cells.element(boundBy: i)
            
            print(app.debugDescription)

            XCTAssert(cell.descendants(matching: .staticText)[items[i].0].exists,
                          "\(items[i].0) does not exist")
            XCTAssert(cell.descendants(matching: .staticText)[items[i].1].exists,
                          "'\(items[i].1)' does not exist")

        }
        return
    }

}

extension XCUIElement {
    func forceTapElement() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.0, dy:0.0))
            coordinate.tap()
        }
    }
}

// July 6, 2022
// Types one character at a time into a TextField, working around the problem of typing the entire string at once
// whch causes dropped characters

extension XCUIElement {
    func typeTextSlowly(_ str: String) {
        for char in str {
            usleep(500000)
            self.typeText(String(char))
        }
    }
}
