//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit
import AVFoundation

class MainScreenViewController: UIViewController {

    public var viewModel: MainScreenViewModel!
    @IBOutlet private weak var beatLabel: BeatLabel!
    private var metronome: Metronome?

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(viewModel != nil)
        beatLabel.configureWith(viewModel: viewModel.beatViewModel)

        let fileUrl = Bundle.main.url(forResource: "tick", withExtension: "wav")!
        metronome = Metronome(fileURL: fileUrl)
        metronome?.play(bpm: 90)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
