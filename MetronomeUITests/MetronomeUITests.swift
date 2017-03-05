//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import XCTest

class MetronomeUITests: XCTestCase {

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testExample() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["beats-per-minute"].exists)
        XCTAssertTrue(app.otherElements["gradient"].exists)
    }
}
