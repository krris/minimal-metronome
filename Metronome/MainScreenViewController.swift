//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit
import AVFoundation

final class MainScreenViewController: UIViewController, SlideViewDelegate {

    public var viewModel: MainScreenViewModel!

    @IBOutlet private weak var beatLabel: BeatLabel!
    @IBOutlet private weak var slideView: SlideView!
    @IBOutlet private weak var playPauseButton: PlayPauseButton!

    private var metronome: Metronome?
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    private var previousVelocity: CGPoint?
    private let fallbackBpm: Int = 60

    private var bpm: Int {
        if let value = Int(viewModel.beatViewModel.beatsPerMinute) {
            return value
        } else {
            assertionFailure("Cannot get BPM from the view model")
            return fallbackBpm
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(viewModel != nil)
        beatLabel.configureWith(viewModel: viewModel.beatViewModel)

        guard let fileUrl = Bundle.main.url(forPlayable: SoundResources.Tick.self) else {
            fatalError("Cannot open a sound resource.")
        }
        metronome = Metronome(fileURL: fileUrl)
        metronome?.play(bpm: bpm)

        selectionFeedbackGenerator.prepare()

        slideView.delegate = self
    }

    // MARK: SlideViewDelegate

    func sliderDidChangeValue(value: Int) {
        guard let metronome = metronome else { return }

        let beatViewModel = BeatViewModel(beatsPerMinute: value)
        viewModel = MainScreenViewModel(beatViewModel: beatViewModel)
        beatLabel.configureWith(viewModel: beatViewModel)

        if metronome.isPlayling {
            metronome.play(bpm: bpm)
        }

        selectionFeedbackGenerator.selectionChanged()
    }

    // MARK: Actions

    @IBAction func didTapPlayPauseButton(_ sender: PlayPauseButton) {
        switch sender.buttonState {
        case .play:
            metronome?.stop()
        case .pause:
            metronome?.play(bpm: bpm)
        }
    }
}
