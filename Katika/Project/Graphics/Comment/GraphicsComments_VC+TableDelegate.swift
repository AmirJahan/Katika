import UIKit

extension GraphicsComments_VC
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
            guard let thisShot = shot else { return }
            
                 thisShot.shotComments.remove(at: indexPath.row)
                self.commentsDelegate!.commentsUpdated()
                
            
            tableView.deleteRows(at: [indexPath],
                                 with: UITableView.RowAnimation.left)
            
            
        }
    }
}
