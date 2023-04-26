
import UIKit
import AVFoundation

extension Graphics_VC
{
    func loadComments()
    {
        guard let thisShot = shot else { return }
        
        if thisShot.shotComments.count == 0
        {
            commentsBadge.isHidden = true
        }
        else
        {
            commentsBadge.isHidden = false
            commentsBadge.text = "\(thisShot.shotComments.count)"
        }
    }
}
