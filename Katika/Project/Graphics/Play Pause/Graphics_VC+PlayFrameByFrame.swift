import UIKit

extension Graphics_VC
{
    @objc
    func playFrameByFrame ()
    {
        playTime += 0.04
        

        if playTime >= shot.duration!
        {
            
                
                
            playTime = 0.0
            shotSlider.value = 0.0
            
            player?.currentTime = TimeInterval(shot.startTime!)
        }
        
       

        shotSlider.value = playTime
        shotEndLabel.text = "\(Int(playTime + shot.startTime!))\""
        
        let playTimeFrame = Int (playTime * 25)
        
        
        if playTime >= shot.duration!
         {
             stop ()
             return
         }
        
        playArtworks(playTimeFrame)
    }
    
    
    
}
