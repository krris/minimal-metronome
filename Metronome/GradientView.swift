//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

final class GradientView: UIView {
    private let gradient = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpGradient()
        accessibilityIdentifier = "gradient"
    }

    override func layoutSubviews() {
        updateGradientLocation()
    }

    // MARK: Private

    private func setUpGradient() {
        gradient.colors = [MetronomeColor.Gradient.green.cgColor, MetronomeColor.Gradient.blue.cgColor]
        gradient.frame = bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.2, y: 1.2)
        layer.insertSublayer(gradient, at: 0)
    }

    private func updateGradientLocation() {
        gradient.frame = bounds
    }
}
