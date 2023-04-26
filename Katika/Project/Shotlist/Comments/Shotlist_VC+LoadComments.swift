
import UIKit
import AVFoundation

extension Shotlist_VC
{
    func loadComments()
    {
        guard let project = AppData.curProject else { return }
        
        if project.shotlistComments.count == 0
        {
            commentsBadge.isHidden = true
        }
        else
        {
            commentsBadge.isHidden = false
            commentsBadge.text = "\(project.shotlistComments.count)"
        }
    }
}
