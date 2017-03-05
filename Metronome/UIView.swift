//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

// Make UIView reusable by loading a view from .xib
protocol Reusable {
    // A name of the .xib file
    var nibName: String { get }
}

extension UIView {
    open override func awakeAfter(using aDecoder: NSCoder) -> Any? {
        if let reusableView = self as? Reusable {
            return substituteWithFirstViewFromNibNamed(nibName: reusableView.nibName,
                                                       onCondition: subviews.count == 0)
        }

        return self
    }

    private func substituteWithFirstViewFromNibNamed(nibName: String, onCondition condition: @autoclosure () -> Bool) -> UIView {
        if condition() {
            let nib = UINib(nibName: nibName, bundle: nil)
            if let view = nib.instantiate(withOwner: nil, options: nil).first as? UIView {
                view.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints
                return view
            }
        }

        return self
    }
}
