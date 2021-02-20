//
//  ClassifyUITests.swift
//  ClassifyUITests
//
//  Created by Arsalan Khan on 18/02/2021.
//

import XCTest

class ClassifyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testListScreenUIElementsExists() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.firstMatch
        let _ = table.waitForExistence(timeout: 20.0)
        
        XCTAssertTrue(table.cells.firstMatch.staticTexts["price"].exists)
        XCTAssertTrue(table.cells.firstMatch.staticTexts["time"].exists)
        XCTAssertTrue(table.cells.firstMatch.staticTexts["title"].exists)
                        
    }
    
    func testListDetailScreenUIElementsExists() throws {

        let app = XCUIApplication()
        app.launch()
                
        let table = app.tables.firstMatch
        let _ = table.waitForExistence(timeout: 20.0)

        table.cells.containing(.staticText, identifier:"Notebook").otherElements["carousel"].tap()

        let scrollView = app.scrollViews.firstMatch

        let _ = scrollView.waitForExistence(timeout: 4)

        XCTAssertTrue(scrollView.exists)
        
        XCTAssertTrue(scrollView.staticTexts["price"].exists)
        XCTAssertTrue(scrollView.staticTexts["time"].exists)
        XCTAssertTrue(scrollView.staticTexts["title"].exists)
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
