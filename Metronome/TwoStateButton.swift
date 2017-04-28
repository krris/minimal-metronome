//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

class TwoStateButton: UIButton {

    enum State {
        case first
        case second
    }

    public private(set) var buttonState: State = .first

    private var firstStateImage: UIImage!
    private var secondStateImage: UIImage!

    override func awakeFromNib() {
        super.awakeFromNib()

        addTarget(self, action: #selector(didTapButton(button:)), for: UIControlEvents.touchUpInside)
        tintColor = UIColor.white
    }

    public func configureWith(viewModel: TwoStateButtonViewModel) {
        firstStateImage = viewModel.firstStateImage
        secondStateImage = viewModel.secondStateImage
        updateImageBasedOnState()
    }

    // MARK: private

    @objc private func didTapButton(button: UIButton) {
        switch buttonState {
        case .first:
            buttonState = .second
        case .second:
            buttonState = .first
        }
        updateImageBasedOnState()
    }

    private func updateImageBasedOnState () {
        switch buttonState {
        case .first:
            setImage(firstStateImage, for: UIControlState.normal)
        case .second:
            setImage(secondStateImage, for: UIControlState.normal)
        }
    }
}
