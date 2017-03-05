//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

final class BeatView: UIView, Reusable {
    let nibName: String = "BeatView"
    private let gradient = CAGradientLayer()
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var beatLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpGradientView()
    }

    override func layoutSubviews() {
        updateGradientLocation()
    }

    // MARK: Configuration

    public func configureWithViewModel(viewModel: BeatViewModel) {
        beatLabel.text = viewModel.beatsPerMinute
    }

    // MARK: Gradient

    private func setUpGradientView() {
        gradient.colors = [MetronomeColor.Gradient.green.cgColor, MetronomeColor.Gradient.blue.cgColor]
        gradient.frame = bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.2, y: 1.2)
        backgroundView.layer.addSublayer(gradient)
    }

    private func updateGradientLocation() {
        gradient.frame = bounds
    }
}
