//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

class TwoStateButton: UIButton {

    private var firstStateImage: UIImage!
    private var secondStateImage: UIImage!

    private var stateNo: UInt = 0

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
        stateNo = (stateNo + 1) % 2
        updateImageBasedOnState()
    }

    private func updateImageBasedOnState () {
        if stateNo == 0 {
            setImage(firstStateImage, for: UIControlState.normal)
        } else if stateNo == 1 {
            setImage(secondStateImage, for: UIControlState.normal)
        }
    }
}
