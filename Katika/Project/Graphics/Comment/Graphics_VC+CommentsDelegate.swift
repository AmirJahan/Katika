import UIKit

extension Graphics_VC : GraphicsCommentsDelegate
{
    func commentsUpdated()
    {
        loadComments()
    }
}
