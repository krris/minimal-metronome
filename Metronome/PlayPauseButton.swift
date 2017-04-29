//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

class PlayPauseButton: UIButton {

    enum State {
        case play
        case pause
    }

    public private(set) var buttonState: State = .play

    private var playImage: UIImage!
    private var pauseImage: UIImage!

    override func awakeFromNib() {
        super.awakeFromNib()

        guard let playImage = UIImage(named: "pause"), let pauseImage = UIImage(named: "play") else {
            fatalError("Cannot open an image.")
        }

        self.playImage = playImage
        self.pauseImage = pauseImage
        updateImageBasedOnState()

        addTarget(self, action: #selector(didTapButton(button:)), for: UIControlEvents.touchUpInside)
        tintColor = UIColor.white
    }

    // MARK: private

    @objc private func didTapButton(button: UIButton) {
        switch buttonState {
        case .play:
            buttonState = .pause
        case .pause:
            buttonState = .play
        }
        updateImageBasedOnState()
    }

    private func updateImageBasedOnState () {
        switch buttonState {
        case .play:
            setImage(playImage, for: UIControlState.normal)
        case .pause:
            setImage(pauseImage, for: UIControlState.normal)
        }
    }
}
