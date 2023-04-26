import UIKit

extension Export_VC
{
    @IBAction func scrubVideo (_ sender: UISlider)
    {
        playing = false
         playOrStopButton.setTitle("▶︎",
                                   for: UIControl.State.normal)
        

        if playTimer != nil
        {
         playTimer!.invalidate()
        }
         if ( player  != nil)
           {
               if player!.isPlaying
               {
                   player?.stop()
               }
           }
        
        
        
        let val = sender.value
        
        playTime = val
        player?.currentTime = Double (val)
    }
}
