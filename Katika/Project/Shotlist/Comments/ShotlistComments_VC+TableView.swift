import UIKit

extension ShotlistComments_VC:
    UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return project!.shotlistComments.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCellId") as! ShotlistCommentsTableViewCell
        
        
        var comment: Comment
        
        comment = project!.shotlistComments[indexPath.row]
        
        
        cell.commentTextView.text = comment.comment
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateString = df.string(from: comment.date)
        cell.commentDate.text = dateString
        
        
        
        
        
        cell.authorLabel.text = comment.author.name

        
        
        
        return cell
    }
}
