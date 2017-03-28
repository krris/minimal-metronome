//
//  Copyright © 2017 KrrisPl. All rights reserved.
//

import Foundation
import AVFoundation

class Metronome {
    public private(set) var bpm: Int = 0
    private let tickAudioFile: AVAudioFile
    private let audioPlayerNode: AVAudioPlayerNode
    private let audioEngine: AVAudioEngine

    init?(fileURL: URL) {

        do {
            tickAudioFile = try AVAudioFile(forReading: fileURL)
        } catch {
            fatalError("Cannot load an audio file: \(error)")
        }

        audioPlayerNode = AVAudioPlayerNode()

        audioEngine = AVAudioEngine()
        audioEngine.attach(self.audioPlayerNode)
        audioEngine.connect(audioPlayerNode, to: audioEngine.mainMixerNode, format: tickAudioFile.processingFormat)

        do {
            try audioEngine.start()
        } catch {
            fatalError("Cannot start an audio engine \(error)")
        }
    }

    // MARK: API

    func play(bpm: Int) {
        self.bpm = bpm
        let buffer = generateBuffer(bpm: bpm)

        if audioPlayerNode.isPlaying {
            audioPlayerNode.scheduleBuffer(buffer, at: nil, options: .interruptsAtLoop, completionHandler: nil)
        } else {
            self.audioPlayerNode.play()
        }

        self.audioPlayerNode.scheduleBuffer(buffer, at: nil, options: .loops, completionHandler: nil)
    }

    func stop() {
        audioPlayerNode.stop()
    }

    // MARK: Private

    private func generateBuffer(bpm: Int) -> AVAudioPCMBuffer {
        tickAudioFile.framePosition = 0
        let periodLength = AVAudioFrameCount(tickAudioFile.processingFormat.sampleRate * 60 / Double(bpm))
        let buffer = AVAudioPCMBuffer(pcmFormat: tickAudioFile.processingFormat, frameCapacity: periodLength)
        do {
            try tickAudioFile.read(into: buffer)
        } catch {
            fatalError("Cannot create a buffer: \(error)")
        }
        buffer.frameLength = periodLength
        return buffer
    }
}
