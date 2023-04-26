import UIKit

extension GraphicsComments_VC
{
    @IBAction func addNewComment ( _ sender: UIButton)
    {
        guard let thisShot = shot else { return }
        
        let commentText = newCommentsTextView.text
        
        if commentText == "" { return }
        
        let date = Date ()
        
        let comment = Comment(author: AppData.user,
                              comment: commentText!,
                              date: date)
        
        
        thisShot.shotComments.append(comment)
        self.commentsDelegate!.commentsUpdated()
        
        
        self.commentsTableView.reloadData()
        
        newCommentsTextView.text = "Add your comment"
        
        // NEW
        self.dismiss(animated: true, completion: nil)
    }
}
