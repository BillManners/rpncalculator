//
//  rpncalculatorUITests.swift
//  rpncalculatorUITests
//
//  Created by Manners, William (Coll) on 09/06/2020.
//  Copyright © 2020 Manners, William (Coll). All rights reserved.
//

import XCTest

class rpncalculatorUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testInput() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "56"
        //act
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        let actual = app.staticTexts["display"].label
        //assert
        XCTAssertEqual(actual,expected)
        
        
    }
    
    func testLongerInput() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "56 93 * "
        //act
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["Enter"].tap()
        app.buttons["9"].tap()
        app.buttons["3"].tap()
        app.buttons["*"].tap()
        let actual = app.staticTexts["display"].label
        //assert
        XCTAssertEqual(actual,expected)
        
        
    }
    
    func testFullCalculation() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "3 "
        //act
        app.buttons["2"].tap()
        app.buttons["Enter"].tap()
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["Eval"].tap()
        let actual = app.staticTexts["display"].label
        //assert
        XCTAssertEqual(actual,expected)
        
        
    }
    
    func testChangeSign() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "-708"
        //act
        app.buttons["7"].tap()
        app.buttons["0"].tap()
        app.buttons["+/-"].tap()
        app.buttons["8"].tap()
        let actual = app.staticTexts["display"].label
        //assert
        XCTAssertEqual(actual,expected)
        
        
    }
    
    func testInfoBox() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        //act
        app.buttons[" "].tap()
        let actual = app.alerts["Help"].exists
        //assert
        XCTAssertTrue(actual)
        
        
    }
    
    func testLongSum() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = "-2 "
        //act
        app.buttons["4"].tap()
        app.buttons["Enter"].tap()
        app.buttons["8"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["/"].tap()
        app.buttons["Eval"].tap()
        let actual = app.staticTexts["display"].label
        //assert
        XCTAssertEqual(actual,expected)
            
            
        
    }
    
    func testClearAll() {
        //arrange
        let app = XCUIApplication()
        app.launch()
        let expected = ""
        //act
        app.buttons["7"].tap()
        app.buttons["0"].tap()
        app.buttons["+/-"].tap()
        app.buttons["8"].tap()
        app.buttons["CLR"].tap()
        let actual = app.staticTexts["display"].label
        //assert
        XCTAssertEqual(actual,expected)
        
        
    }

// This is important, but it runs so slowly
//    func testLaunchPerformance() {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
