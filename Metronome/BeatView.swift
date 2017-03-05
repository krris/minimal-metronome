//
//  BeatView.swift
//  Metronome
//
//  Created by krris on 02/03/2017.
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

final class BeatView: UIView, Reusable {
    let nibName: String = "BeatView"
    let gradient = CAGradientLayer()

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpGradientView()
    }

    override func layoutSubviews() {
        updateGradientLocation()
    }

    // MARK: Gradient

    private func setUpGradientView() {
        gradient.frame = bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        layer.addSublayer(gradient)
    }

    private func updateGradientLocation() {
        gradient.frame = bounds
    }
}
