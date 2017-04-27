//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import Foundation

protocol Playable {
    static var filename: String { get }
    static var fileExtension: String { get }
}

struct SoundResources {
    struct Tick: Playable {
        static let filename: String = "tick"
        static let fileExtension: String = "wav"
    }
}
