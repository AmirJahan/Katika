import UIKit

extension GraphicsSuggestions_VC
{
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath)
    {

            self.suggestionDelegate.makeMainArtworks(suggestionIndex: indexPath.row)
            
            self.dismiss(animated: true,
                         completion: nil)
    }
    
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
            // deleting the shot
            
            shot.suggestions.remove(at: indexPath.row)
            ReadWrite.write()
            
            self.suggestionDelegate.updateSuggestionsBadge()
            
//            self.suggestionDelegate.deleteSuggestionAt(index: indexPath.row )
            tableView.deleteRows(at: [indexPath],
                                 with: UITableView.RowAnimation.left)
            
            
            
//            self.delegate.shotSuggestionsUpdated(shot: <#T##Shot#>)
        }
    }
}
