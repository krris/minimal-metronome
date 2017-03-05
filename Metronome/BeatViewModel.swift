//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import Foundation

struct BeatViewModel {
    let beatsPerMinute: String

    init(beatsPerMinute: String) {
        self.beatsPerMinute = beatsPerMinute
    }

    init(beatsPerMinute: Int) {
        self.beatsPerMinute = String(beatsPerMinute)
    }
}
