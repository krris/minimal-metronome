//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit
import AVFoundation

final class MainScreenViewController: UIViewController, SlideViewDelegate {

    public var viewModel: MainScreenViewModel!

    @IBOutlet private weak var beatLabel: BeatLabel!
    @IBOutlet private weak var slideView: SlideView!
    @IBOutlet private weak var playPauseButton: TwoStateButton!

    private var metronome: Metronome?
    private let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    private var previousVelocity: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(viewModel != nil)
        beatLabel.configureWith(viewModel: viewModel.beatViewModel)
        configurePlayPauseButton()

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

    // MARK: private 

    private func configurePlayPauseButton() {
        guard let playImage = UIImage(named: "pause"), let pauseImage = UIImage(named: "play") else {
            fatalError("Cannot open an image.")
        }
        let playPauseViewModel = TwoStateButtonViewModel(firstStateImage: playImage, secondStateImage: pauseImage)
        playPauseButton.configureWith(viewModel: playPauseViewModel)

    }
}
