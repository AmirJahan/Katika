import UIKit

extension Script_VC
{
    func stopPlayBack ()
    {
        if ( player  != nil)
        {
            if player!.isPlaying
            {
                player?.stop()
            }
        }
    }
}
