import UIKit

extension ShotlistComments_VC
{
    func tableView(_ tableView: UITableView,
                   canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath)
    {
        
        if editingStyle == .delete
        {
            // deleting the comment
            guard let project = AppData.curProject else { return }
            
                 project.shotlistComments.remove(at: indexPath.row)
                self.shotlistDelegate!.commentsUpdated()
                
            
            tableView.deleteRows(at: [indexPath],
                                 with: UITableView.RowAnimation.left)
            
            
        }
    }
}
