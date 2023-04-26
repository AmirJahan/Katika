import UIKit


extension Graphics_VC
{
    func stop ()
    {
        playMode = false
        

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
    }
}
