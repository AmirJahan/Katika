import UIKit
import AVFoundation

extension Graphics_VC
{
    @IBAction func playShot()
    {
        if !playMode
        {
            // play
            playMode = true
            
            playPauseButton.setTitle("Pause", for: UIControl.State.normal)
            playPauseButton.backgroundColor = UIColor.gray
            
            play ()
        }
        else
        {
            playPauseButton.setTitle("Play", for: UIControl.State.normal)
            playPauseButton.backgroundColor = UIColor.primary
            
            stop ()
        }
     }
}
