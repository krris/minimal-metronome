//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    public var viewModel: MainScreenViewModel!
    @IBOutlet private weak var beatLabel: BeatLabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(viewModel != nil)
        beatLabel.configureWith(viewModel: BeatViewModel(beatsPerMinute: 121))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
