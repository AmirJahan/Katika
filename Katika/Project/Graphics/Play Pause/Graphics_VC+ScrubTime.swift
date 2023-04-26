import UIKit

extension Graphics_VC
{
    @IBAction func scrubTime (_ sender: UISlider)
    {
        stop ()
        let val = sender.value
        
        playTime = val
        player?.currentTime = Double (val + shot.startTime!)
        shotEndLabel.text = "\(playTime)\""
        
        playArtworks (Int (playTime * 25))
    }
}
