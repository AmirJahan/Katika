import UIKit

extension Export_VC
{
    func stopPlay ()
    {
        playing = false
        playOrStopButton.setTitle("▶︎",
                                  for: UIControl.State.normal)
       
        timeSlider.value = 0.0
        playTime = 0
        
        curShotIndex = 0
        setShot(animated: false)
        
        
        // this if statement nis neeeded for someone who comes to export
        // and pops back without playing
        
        if playTimer != nil
        {
            playTimer!.invalidate()
            
        }
        
        if ( player  != nil)
          {
              if player!.isPlaying
              {
                  player?.stop()
                player?.currentTime = 0
              }
          }
    }
}
