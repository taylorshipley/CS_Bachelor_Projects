//
//  Course CatalogUITestsCS3260.swift
//  Course CatalogUITests
//
//  Created by Ted Cowan on 9/26/18.
//  Copyright © 2018 Ted Cowan. All rights reserved.
//

import XCTest

class Course_CatalogUITestsCS3260: XCTestCase {
    		
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLabelsButtonsAndSwitchArePresent() {
        let headingLabel = app.staticTexts["title"]
        XCTAssert(headingLabel.exists, "Text with accessibility identifier 'title' not found")
//        let switchLabel = app.buttons["Show Only Selected Courses"]
//        XCTAssert(switchLabel.exists)
        //let allSwitches = XCUIApplication().switches
        //print("All switches: \(allSwitches.debugDescription)")
        let mySwitch = app.switches["showOnlySelectedCoursesSwitch"]
        XCTAssert(mySwitch.exists, "switch with accessibility identifier 'showOnlySelectedCoursesSwitch' not found")
        mySwitch.tap()
    }
    
    func testTableIsLoaded() {
        let cells = app.descendants(matching: .cell)
        for i in [0, 1, 2, 5, 7] {
            let cell = cells.element(boundBy: i)

            switch i {
            case 0: XCTAssert(cell.descendants(matching: .staticText)["CS 1010"].exists,
                          "CS 1010 does not exist")
                XCTAssert(cell.descendants(matching: .staticText)["Introduction to Interactive Entertainment"].exists,
                          "CS 1010 description does not exist")

            case 1: XCTAssert(cell.descendants(matching: .staticText)["CS 1022"].exists,
                          "CS 1010 does not exist")
                XCTAssert(cell.descendants(matching: .staticText)["Software Development"].exists,
                          "CS 1022 description does not exist")

            case 2: XCTAssert(cell.descendants(matching: .staticText)["CS 1023"].exists,
                          "CS 1023 does not exist")
                XCTAssert(cell.descendants(matching: .staticText)["Selected Programming Language"].exists,
                          "CS 1023 description does not exist")

            case 5: XCTAssert(cell.descendants(matching: .staticText)["CS 1410"].exists,
                          "CS 1410 does not exist")
                XCTAssert(cell.descendants(matching: .staticText)["Object-Oriented Programming"].exists,
                          "CS 1410 description does not exist")

            case 7: XCTAssert(cell.descendants(matching: .staticText)["CS 2250"].exists,
                          "CS 2250 does not exist")
                XCTAssert(cell.descendants(matching: .staticText)["Structured Computing in a Selected Language"].exists,
                          "CS 2250 description does not exist")

                default: print("\(i)")
            }
        }
    }
    
    func testOneCourseIsSelected() {
        let cells = app.descendants(matching: .cell)
        let cell = cells.element(boundBy:4)
        //CS 1400
        cell.tap()
        XCTAssert(cell.descendants(matching: .staticText)["CS 1400"].exists,
                  "the 5th entry should be CS 1400")
//        let images = cell.descendants(matching: .image)
//        let image = images["ischecked"]
        //print("...image...: \(image.debugDescription)")
        XCTAssert(cell.descendants(matching: .image)["ischecked"].exists, "cell is not labeled checked")
//        XCTAssert(buttons.count > 0, "CS 1400 entry in table is not checked")
    }
    
    func testMultipleCoursesAreSelected() {
//        var courses = XCUIApplication().descendants(matching: .staticText)
        //print(courses.debugDescription)
        let cells = app.descendants(matching: .cell)

        //CS 1010
        var cell = cells.element(boundBy: 0)
        cell.tap()
        XCTAssert(cell.descendants(matching: .image)["ischecked"].exists, "cell does not have identifier 'checked'")
        XCTAssert(cell.descendants(matching: .staticText)["CS 1010"].exists)
        //CS 1400
        cell = cells.element(boundBy: 4)
        cell.tap()
        XCTAssert(cell.descendants(matching: .image)["ischecked"].exists, "cell image does not have identifier 'checked'")
        XCTAssert(cell.descendants(matching: .staticText)["CS 1400"].exists)
        //CS 2140
        cell = cells.element(boundBy: 6)
        cell.tap()
        XCTAssert(cell.descendants(matching: .image)["ischecked"].exists, "cell image does not have identifier 'checked'")
        XCTAssert(cell.descendants(matching: .staticText)["CS 2140"].exists)

        // make sure CS 1410 and 2130 are not checked
        
        //CS 1410
        cell = cells.element(boundBy: 5)
        //print(cell.debugDescription)
        XCTAssert(cell.descendants(matching: .image)["unchecked"].exists,
                  "cell image does not have identifier 'unchecked'")
        //CS 2130
        cell = cells.element(boundBy: 7)
        XCTAssert(cell.descendants(matching: .image)["unchecked"].exists,
                  "cell image does not have identifier 'unchecked'")
    }
    
    func testSwitchDisplaysOnlySelectedCourses() {
        var cells = app.descendants(matching: .cell)
        let cell1023 = cells.element(boundBy: 2)
        cell1023.tap()                                          // tap cs1023
        let cell1410 = cells.element(boundBy: 5)
        cell1410.tap()                                          // tap cs1410
        let cell2350 = cells.element(boundBy: 8)
        cell2350.tap()                                          // tap cs2350
        let toggles = app.descendants(matching: .switch)
        //print (toggles.debugDescription)
        let toggle = toggles["showOnlySelectedCoursesSwitch"]
        //print ("my toggle: \(toggle.debugDescription)")
        //print ("my app: \(app.debugDescription)")
        toggle.tap()
        //app.toggles["showOnlySelectedCoursesSwitch"].tap()
        
        // at this point, there should only be 3 rows in the table, sorted and checked

        let rowCount = cells.count
        XCTAssert(rowCount == 3, "Table should have 3 rows, but found \(rowCount)")
        // verify these three cell values are correct
        //toggle.tap()
        cells = app.descendants(matching: .cell)
        let cell0 = cells.element(boundBy: 0)
        let cell1 = cells.element(boundBy: 1)
        let cell2 = cells.element(boundBy: 2)

        XCTAssert(cell0.descendants(matching: .staticText)["CS 1023"].exists,
                  "First row should be CS 1023")
        XCTAssert(cell1.descendants(matching: .staticText)["CS 1410"].exists,
                  "Second row should be CS 1410")
        XCTAssert(cell2.descendants(matching: .staticText)["CS 2350"].exists,
                  "Third row should be CS 2350")
    }
    
    func testSwitchToggleRedisplaysSelectedCourses() {
        let cells = app.descendants(matching: .cell)
        let cell1023 = cells.element(boundBy: 2)
        cell1023.tap()                                          // tap cs1023
        let cell1410 = cells.element(boundBy: 5)
        cell1410.tap()                                          // tap cs1410
        let cell2350 = cells.element(boundBy: 8)
        cell2350.tap()                                          // tap cs2350
        
        app.switches["showOnlySelectedCoursesSwitch"].tap()

        let texts = cells.element(boundBy: 1).staticTexts   // CS 1410
        let second = texts.element(boundBy: 0).label
        XCTAssert(second == "CS 1410", "CS 1410 entry is not the second entry")

    }
        
}



