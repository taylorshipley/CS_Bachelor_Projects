//
//  Bowling ScoresUITestCS3260.swift
//  Bowling ScoresUITests
//
//  Created by Ted Cowan on 9/20/18.
//  Copyright © 2018 TedCowan. All rights reserved.
//

import XCTest

class Bowling_ScoresUITestCS3260: XCTestCase {
    var app: XCUIApplication!
    var device: XCUIDevice!
    var game1Label, game2Label, game3Label: XCUIElement!
    var game1Value, game2Value, game3Value: XCUIElement!
    var calculateButton: XCUIElement!
    var seriesLabel, highLabel, averageLabel: XCUIElement!
    var seriesValue, highValue, averageValue: XCUIElement!
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        //continueAfterFailure = false
        
        // Allowing all tests to run to maximize points
        continueAfterFailure = true
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()
        device = XCUIDevice.shared
        device.orientation = .portrait
        
        game1Label = app.staticTexts["Game 1"]
        XCTAssert(game1Label.exists, "No Game 1 Label found")
        game1Value = app.textFields["game1"]
        XCTAssert(game1Value.exists, "No text field with identifier game1 found")
        
        game2Label = app.staticTexts["Game 2"]
        XCTAssert(game2Label.exists, "No Game 2 Label found")
        game2Value = app.textFields["game2"]
        XCTAssert(game2Value.exists, "No text field with identifier game2 found")
        
        game3Label = app.staticTexts["Game 3"]
        XCTAssert(game3Label.exists, "No Game 3 Label found")
        game3Value = app.textFields["game3"]
        XCTAssert(game3Value.exists, "No text field with identifier game3 found")

        calculateButton = app.buttons["calculate"]
        XCTAssert(calculateButton.exists, "No button labeled Calculate found")

        seriesLabel = app.staticTexts["Series"]
        XCTAssert(seriesLabel.exists, "No Series Label found")
        let seriesValueElementsQuery = app.otherElements.containing(.staticText, identifier:"series")
        seriesValue = seriesValueElementsQuery.children(matching: .staticText).element(boundBy: 1)
        XCTAssert(seriesValue.exists, "No text field with identifier series found")
        
        averageLabel = app.staticTexts["Average"]
        XCTAssert(averageLabel.exists, "No Average Label found")
        let averageValueElementsQuery = app.otherElements.containing(.staticText, identifier:"average")
        averageValue = averageValueElementsQuery.children(matching: .staticText).element(boundBy: 1)
        XCTAssert(averageValue.exists, "No text field with identifier ave found")
 
        highLabel = app.staticTexts["High"]
        XCTAssert(highLabel.exists, "No High Label found")
        let highValueElementsQuery = app.otherElements.containing(.staticText, identifier:"high")
        highValue = highValueElementsQuery.children(matching: .staticText).element(boundBy: 1)
        XCTAssert(highValue.exists, "No text field with identifier high found")

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        device.orientation = .portrait
    }
    
    func testAllFieldsFound() {
        XCTAssert(game1Label.exists, "No Game 1 Label found")
        XCTAssert(game1Value.exists, "No text field with identifier game1 found")
        
        XCTAssert(game2Label.exists, "No Game 2 Label found")
        XCTAssert(game2Value.exists, "No text field with identifier game2 found")
        
        XCTAssert(game3Label.exists, "No Game 3 Label found")
        XCTAssert(game3Value.exists, "No text field with identifier game3 found")
        
        XCTAssert(calculateButton.exists, "No button labeled calculate found")
        
        XCTAssert(seriesLabel.exists, "No Series Label found")
        XCTAssert(seriesValue.exists, "No text field with identifier series found")
        
        XCTAssert(averageLabel.exists, "No Average Label found")
        XCTAssert(averageValue.exists, "No text field with identifier average found")
        
        XCTAssert(highLabel.exists, "No High Label found")
        XCTAssert(highValue.exists, "No text field with identifier high found")

    }
        
    func testBasicCalculations() {
        game1Value.tap()
        sleep(1)
        game1Value.typeText("100")
        XCTAssertEqual(game1Value.value as! String, "100")

        game2Value.tap()
        sleep(1)
        game2Value.typeText("200")

        game3Value.tap()
        sleep(1)
        game3Value.typeText("300") 

        app.buttons["calculate"].tap()
        sleep(1)

        /*
        XCTAssertEqual(seriesValue.value as! String, "600", "Series does not equal 600")
        XCTAssertEqual(averageValue.value as! String, "200", "Average does not equal 200")
        XCTAssertEqual(highValue.value as! String, "300","High does not equal 300")
        */
        let s = app.staticTexts["series"].value as! String
        sleep(1)
        let a = app.staticTexts["average"].value as! String
        sleep(1)
        let h = app.staticTexts["high"].value as! String
        sleep(1)

        XCTAssertEqual(s, "600", "Series does not equal 600")
        XCTAssertEqual(a, "200", "Average does not equal 200")
        XCTAssertEqual(h, "300","High does not equal 300")

    }
    
    func testAllZeroes() {
        game1Value.tap()
        sleep(1)
        game1Value.typeText("0")
        
        game2Value.tap()
        sleep(1)
        game2Value.typeText("0")
        
        game3Value.tap()
        sleep(1)
        game3Value.typeText("0")
        app.buttons["calculate"].tap()
        sleep(1)
    
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").value as! String, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").value as! String, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").value as! String, "0")
    }
    
    func testZero100100() {
        game1Value.tap()
        sleep(1)
        game1Value.typeText("0")

        game2Value.tap()
        sleep(1)
        game2Value.typeText("100")
        
        game3Value.tap()
        sleep(1)
        game3Value.typeText("100")
        app.buttons["calculate"].tap()
        sleep(1)

        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").value as! String, "200")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").value as! String, "100")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").value as! String, "100")
    }
    
    func testNonAlphaEntries() {
        game1Value.tap()
        sleep(1)
        game1Value.typeText("mickey")
        
        game2Value.tap()
        sleep(1)
        game2Value.typeText("donald")
        
        game3Value.tap()
        sleep(1)
        game3Value.typeText("minnie")
        app.buttons["calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").value as! String, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").value as! String, "0")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").value as! String, "0")
    }
    
    func testIntegerMathRoundingDown() {
        game1Value.tap()
        sleep(1)
        game1Value.typeText("101")
        
        game2Value.tap()
        sleep(1)
        game2Value.typeText("105")
        
        game3Value.tap()
        sleep(1)
        game3Value.typeText("107")
        app.buttons["calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").value as! String, "313")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").value as! String, "104")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").value as! String, "107")
    }
    
    func testIntegerMathNotRoundingUp() {
        game1Value.tap()
        sleep(1)
        game1Value.typeText("105")
        
        game2Value.tap()
        sleep(1)
        game2Value.typeText("105")
        
        game3Value.tap()
        sleep(1)
        game3Value.typeText("107")
        app.buttons["calculate"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "series").value as! String, "317")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "average").value as! String, "105")
        XCTAssertEqual(app.staticTexts.element(matching:.any, identifier: "high").value as! String, "107")
    }

    
}

extension Double {
    func roundTo(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension CGFloat {
    func roundTo(_ places:Int) -> CGFloat {
        let divisor = pow(10.0, CGFloat(places))
        return (self * divisor).rounded() / divisor
    }
}

