import UIKit

extension Script_VC : ScriptCommentsDelegate
{
    func commentsUpdated()
    {
        loadComments()
    }
}
