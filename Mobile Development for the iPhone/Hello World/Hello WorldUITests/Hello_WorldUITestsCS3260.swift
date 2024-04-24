//
//  Hello_WorldUITestsCS3260.swift
//  Hello WorldUITestsCS3260
//
//  Created by Ted Cowan on 8/23/18.
//  Copyright © 2018 TedCowan. All rights reserved.
//

//  Students: do not modify this file in any way.

import XCTest

class Hello_WorldUITestsCS3260: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testForHelloWorldLabel() {
        XCTAssert(XCUIApplication().staticTexts["Hello, world!"].exists) 
    }
    
}
