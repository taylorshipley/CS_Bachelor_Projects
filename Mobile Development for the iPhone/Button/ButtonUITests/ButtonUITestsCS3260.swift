//
//  ButtonUITestsCS3260.swift
//  ButtonUITests
//
//  Created by Ted Cowan on 5/5/22.
//  Copyright © 2022 TedCowan. All rights reserved.
//

//  Students: do not modify this file in any way.

import XCTest

class ButtonUITestsCS3260: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testButtonsAndTextFieldsArePresent() {
        XCTAssertTrue(app.buttons["Change"].exists, "Change button not found")
        XCTAssertTrue(app.staticTexts["season"].exists, "Text field with 'season' not found")

    }
        
    func testTextFieldSaysIntialAtStartup() {
        XCTAssertTrue(app.buttons["Change"].exists, "Change button not found")
        XCTAssertTrue(app.staticTexts["season"].exists, "Field with accessibility label 'season' not found")
        let t = app.staticTexts["season"].value! as! String
        let testString = "Initial"

        XCTAssertTrue(t == "Initial", "Text field should say '\(testString)' upon app startup but instead says '\(t)'.")

    }
    
    func testTextFieldSaysWinterAfter1Tap() {
        XCTAssertTrue(app.buttons["Change"].exists, "Change button not found")
        XCTAssertTrue(app.staticTexts["season"].exists, "Change button not found")

        app.buttons["Change"].tap()
        let t = app.staticTexts["season"].value! as! String
        let testString = "Winter"
        XCTAssertTrue(t == testString, "Text field should say '\(testString)' after 1 button tap but instead says '\(t)'.")

    }
 
    func testTextFieldSaysSpringAfter2Taps() {
        XCTAssertTrue(app.buttons["Change"].exists, "Change button not found")
        XCTAssertTrue(app.staticTexts["season"].exists, "Change button not found")

        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        let t = app.staticTexts["season"].value! as! String
        let testString = "Spring"
        XCTAssertTrue(t == testString, "Text field should say '\(testString)' after 2 button taps but instead says '\(t)'.")

    }

    func testTextFieldSaysSummerAfter3Taps() {
        XCTAssertTrue(app.buttons["Change"].exists, "Change button not found")
        XCTAssertTrue(app.staticTexts["season"].exists, "Change button not found")

        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        let t = app.staticTexts["season"].value! as! String
        let testString = "Summer"
        XCTAssertTrue(t == testString, "Text field should say '\(testString)' after 3 button taps but instead says '\(t)'.")


    }
    
    func testTextFieldSaysFallAfter4Taps() {
        XCTAssertTrue(app.buttons["Change"].exists, "Change button not found")
        XCTAssertTrue(app.staticTexts["season"].exists, "Change button not found")

        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        let t = app.staticTexts["season"].value! as! String
        let testString = "Fall"
        XCTAssertTrue(t == testString, "Text field should say '\(testString)' after 4 button taps but instead says '\(t)'.")

    }
    
    func testTextFieldSaysWinterAfter5Taps() {
        XCTAssertTrue(app.buttons["Change"].exists, "Change button not found")

        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        app.buttons["Change"].tap()
        
        let t = app.staticTexts["season"].value! as! String
        let testString = "Winter"
        XCTAssertTrue(t == testString, "Text field should say '\(testString)' after 5 button taps but instead says '\(t)'.")

    }

}
