//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit
import AVFoundation

final class MainScreenViewController: UIViewController, SlideViewDelegate {

    public var viewModel: MainScreenViewModel!

    @IBOutlet private weak var beatLabel: BeatLabel!
    @IBOutlet private weak var slideView: SlideView!

    private var metronome: Metronome?
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    private var previousVelocity: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(viewModel != nil)
        beatLabel.configureWith(viewModel: viewModel.beatViewModel)

        guard let fileUrl = Bundle.main.url(forPlayable: SoundResources.Tick.self) else {
            fatalError("Cannot open a sound resource.")
        }
        metronome = Metronome(fileURL: fileUrl)
        metronome?.play(bpm: Int(viewModel.beatViewModel.beatsPerMinute)!)
        selectionFeedbackGenerator.prepare()

        slideView.delegate = self
    }

    // MARK: SlideViewDelegate

    func sliderDidChangeValue(value: Int) {
        let viewModel = BeatViewModel(beatsPerMinute: value)
        beatLabel.configureWith(viewModel: viewModel)
        selectionFeedbackGenerator.selectionChanged()
    }
}
