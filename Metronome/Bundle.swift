//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import Foundation

extension Bundle {
    func url(forPlayable playable: Playable.Type) -> URL? {
        return self.url(forResource: playable.filename, withExtension: playable.fileExtension)
    }
}
