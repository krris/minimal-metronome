//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import XCTest
@testable import Metronome

class StoryboardsTests: XCTestCase {

    func testMainScreenInitialization() {
        let expectedBeatsPerMinute = "61"
        let viewModel = MainScreenViewModel(beatViewModel: BeatViewModel(beatsPerMinute: expectedBeatsPerMinute))
        let mainScreenVC = Storyboards.MainScreen.instantiate(viewModel: viewModel)

        XCTAssertNotNil(mainScreenVC.viewModel)
        XCTAssertEqual(mainScreenVC.viewModel.beatViewModel.beatsPerMinute, expectedBeatsPerMinute)
    }
}
