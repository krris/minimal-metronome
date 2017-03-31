//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

protocol SlideViewDelegate: class {
    func sliderDidChangeValue(value: Int)
}

@IBDesignable
final class SlideView: UIView {

    public weak var delegate: SlideViewDelegate?
    @IBInspectable var minimum: Int = 0
    @IBInspectable var maximum: Int = 100
    @IBInspectable var step: Int = 1
    @IBInspectable var initialValue: Int = 50

    private var panGestureRecognizer: UIPanGestureRecognizer?
    private var currentValue: Int?

    override func awakeFromNib() {
        super.awakeFromNib()

        currentValue = initialValue
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didRecognizePanGesture(_:)))

        guard let panGestureRecognizer = panGestureRecognizer else { return }
        addGestureRecognizer(panGestureRecognizer)
    }

    func didRecognizePanGesture(_ sender: UIPanGestureRecognizer) {

        let distance = -sender.translation(in: self).y
        let normalizedDistance = distance / self.frame.height

        let step = normalizedDistance

        guard var bpm = currentValue else { return }

        let cumulativeStep: CGFloat = 0.008

        let didIncrement: Bool = (step >= cumulativeStep)
        let didDecrement: Bool = (step <= -cumulativeStep)
        if didIncrement {
            bpm += 1
        }
        if didDecrement {
            bpm -= 1
        }

        if bpm < 40 {
            bpm = 40
        } else if bpm > 230 {
            bpm = 230
        }

        if didIncrement || didDecrement {
            sender.setTranslation(CGPoint.zero, in: self)
            currentValue = bpm
            delegate?.sliderDidChangeValue(value: bpm)
        }
    }

}
