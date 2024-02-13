import UIKit
import AVFoundation

extension Export_VC {
    func play() {
        player!.play()

        playTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(playFrameByFrame),
                                         userInfo: nil,
                                         repeats: true)
    }
}
