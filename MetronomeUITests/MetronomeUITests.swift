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

    func testIfLabelAndGradientIsDisplayed() {
        let app = XCUIApplication()
        XCTAssertTrue(app.staticTexts["beats-per-minute"].exists)
        XCTAssertTrue(app.otherElements["gradient"].exists)
    }

    func testIfSwipingChangesBeatsPerMinute() {
        let app = XCUIApplication()
        let element = app.otherElements["gradient"].children(matching: .other).element
        let initialBpm = Int(app.staticTexts["beats-per-minute"].label)!

        element.swipeUp()
        let higherBpm = Int(app.staticTexts["beats-per-minute"].label)!
        assert(initialBpm < higherBpm)

        element.swipeDown()
        let lowerBpm = Int(app.staticTexts["beats-per-minute"].label)!
        assert(lowerBpm < higherBpm)

    }
}
