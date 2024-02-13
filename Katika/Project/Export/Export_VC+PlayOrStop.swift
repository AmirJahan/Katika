import UIKit
import AVFoundation

extension Export_VC {
    @IBAction func playOrStopVideo(_ sender: UIButton) {
        if !playing {
            // begin play
            startPlay()
        } else {
            // stop
            stopPlay()
        }
    }
}
