import UIKit

extension ExportComments_VC:
    UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        return project!.videoComments.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCellId") as! ExportCommentsTableViewCell
        
        
        var comment: VideoComment
        
        comment = project!.videoComments[indexPath.row]
        
        
        cell.commentTextView.text = comment.comment
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateString = df.string(from: comment.date)
        cell.commentDate.text = dateString

        cell.commentTime.text = "\(comment.time)\""
        cell.authorLabel.text = comment.author.name

        
        
        
        return cell
    }
}
