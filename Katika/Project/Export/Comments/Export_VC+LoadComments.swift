
import UIKit
import AVFoundation

extension Export_VC
{
    func loadComments()
    {
        guard let project = AppData.curProject else { return }
        
        if project.videoComments.count == 0
        {
            commentsBadge.isHidden = true
        }
        else
        {
            commentsBadge.isHidden = false
            commentsBadge.text = "\(project.videoComments.count)"
        }
    }
}
