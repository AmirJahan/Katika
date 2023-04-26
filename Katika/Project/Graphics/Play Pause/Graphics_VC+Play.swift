import UIKit
import AVFoundation

extension Graphics_VC
{
    func play ()
    {
        playMode = true
        player!.play()
        
        playTimer = Timer.scheduledTimer(timeInterval: 0.04, // 1/25
            target: self,
            selector: #selector(playFrameByFrame),
            userInfo: nil,
            repeats: true)
    }
}
