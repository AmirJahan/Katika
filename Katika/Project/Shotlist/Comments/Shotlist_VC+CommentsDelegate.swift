import UIKit

extension Shotlist_VC : ShotlistCommentsDelegate
{
    func commentsUpdated()
    {
        loadComments()
    }
}
