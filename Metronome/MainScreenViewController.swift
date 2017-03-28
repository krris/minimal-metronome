//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import UIKit
import AVFoundation

class MainScreenViewController: UIViewController {

    public var viewModel: MainScreenViewModel!
    @IBOutlet private weak var beatLabel: BeatLabel!
    private var metronome: Metronome?

    private var previousVelocity: CGPoint?

    override func viewDidLoad() {
        super.viewDidLoad()

        assert(viewModel != nil)
        beatLabel.configureWith(viewModel: viewModel.beatViewModel)

        let fileUrl = Bundle.main.url(forResource: "tick", withExtension: "wav")!
        metronome = Metronome(fileURL: fileUrl)
        metronome?.play(bpm: Int(viewModel.beatViewModel.beatsPerMinute)!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Gestures

    @IBAction func didRecognizePanGesture(_ sender: UIPanGestureRecognizer) {

        let currentVelocity = sender.velocity(in: self.view)
        print("Velocity: \(currentVelocity))")
        
        if let previousVelocity = previousVelocity {
            if (previousVelocity.y > 0 && currentVelocity.y < 0) ||
                (previousVelocity.y < 0 && currentVelocity.y > 0) {
                sender.setTranslation(CGPoint.zero, in: self.view)
            }
        }

        let distance = -sender.translation(in: self.view).y
        let normalizedDistance = distance / self.view.frame.height

        print("Translation: \(sender.translation(in: self.view))")
        print("normalized distance: \(normalizedDistance)")

        guard let metronome = metronome else { return }
        var bpm = metronome.bpm + Int(normalizedDistance * 10)

        if bpm < 40 {
            bpm = 40
            sender.setTranslation(CGPoint.zero, in: self.view)
        } else if bpm > 230 {
            bpm = 230
            sender.setTranslation(CGPoint.zero, in: self.view)
        }

        metronome.play(bpm: bpm)
        self.beatLabel.configureWith(viewModel: BeatViewModel(beatsPerMinute: bpm))

        previousVelocity = sender.velocity(in: self.view)
    }
}
