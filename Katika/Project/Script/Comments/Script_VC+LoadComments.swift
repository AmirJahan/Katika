
import UIKit
import AVFoundation

extension Script_VC
{
    func loadComments()
    {
        guard let project = AppData.curProject else { return }
        
        if project.scriptComments.count == 0
        {
            commentsBadge.isHidden = true
        }
        else
        {
            commentsBadge.isHidden = false
            commentsBadge.text = "\(project.scriptComments.count)"
        }
    }
}
