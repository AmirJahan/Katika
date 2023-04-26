import UIKit

extension GraphicsComments_VC:
    UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return shot!.shotComments.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCellId") as! GraphicsCommentsTableViewCell
        
        
        var comment: Comment
        
        comment =  shot!.shotComments[indexPath.row]
        
        
        cell.commentTextView.text = comment.comment
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateString = df.string(from: comment.date)
        cell.commentDate.text = dateString

        
        cell.authorLabel.text = comment.author.name

        
        return cell
    }
}
