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
        gradient.colors = [MetronomeColor.Gradient.green.cgColor, MetronomeColor.Gradient.blue.cgColor]
        gradient.frame = bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1.2, y: 1.2)
        layer.addSublayer(gradient)
    }

    private func updateGradientLocation() {
        gradient.frame = bounds
    }
}
