//
//  TopAlbumAssignmentUITests.swift
//  TopAlbumAssignmentUITests
//
//  Created by Pandey, Prashant A (CORP) on 3/15/20.
//  Copyright © 2020 Prashant Pandey. All rights reserved.
//

import XCTest

class TopAlbumAssignmentUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAlbumListLoading() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let tableQuery = app.tables
        let cellsQuery = tableQuery.cells
                
        let count = NSPredicate(format: "count == 100")
        expectation(for: count, evaluatedWith: cellsQuery, handler: nil)
        waitForExpectations(timeout: 30, handler: nil)
        
        let cellElements = cellsQuery.allElementsBoundByIndex
        cellElements[0].tap()
        
        let backButton = app.navigationBars["Details"].buttons["Top Album"]
        backButton.tap()
        
        cellElements[99].tap()
        
        backButton.tap()
    }


    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
