import UIKit

extension Export_VC : ExportCommentsDelegate
{
    func commentsUpdated()
    {
        loadComments()
    }
}
