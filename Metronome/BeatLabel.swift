//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

final class BeatLabel: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpStyling()
    }

    // MARK: Configuration

    private func setUpStyling() {
        font = UIFont.systemFont(ofSize: 140, weight: UIFontWeightUltraLight)
        textColor = UIColor.white
    }

    public func configureWithViewModel(viewModel: BeatViewModel) {
        text = viewModel.beatsPerMinute
    }
}
