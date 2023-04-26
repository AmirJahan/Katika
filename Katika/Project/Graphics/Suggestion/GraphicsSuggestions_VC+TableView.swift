import UIKit

extension GraphicsSuggestions_VC:
    UITableViewDelegate,
    UITableViewDataSource
{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return shot.suggestions.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "suggestionCellId") as! SuggestionTableViewCell
        
        let artworkSet: ArtworkSet = shot.suggestions[indexPath.row]
         
        cell.authorLabel.text = artworkSet.author.name
        
        cell.commentTextView.text = artworkSet.comment
        
        if cell.imgHolderView.subviews.count > 0
        {
            for any in cell.imgHolderView.subviews
            {
                any.removeFromSuperview()
            }
        }
        let imgView = UIImageView (frame: cell.imgHolderView.bounds)
        imgView.image = artworkSet.img
        cell.imgHolderView.addSubview(imgView)
        
        
        
        return cell
    }
}
