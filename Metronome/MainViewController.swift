//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet private weak var beatView: BeatView!

    override func viewDidLoad() {
        super.viewDidLoad()

        beatView.configureWithViewModel(viewModel: BeatViewModel(beatsPerMinute: 121))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
