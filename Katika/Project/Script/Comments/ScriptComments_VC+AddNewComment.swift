import UIKit

extension ScriptComments_VC
{
    @IBAction func addNewComment ( _ sender: UIButton)
    {
        guard let project = AppData.curProject else { return }
        
        let commentText = newCommentsTextView.text

        if commentText == "" { return }
        
        let date = Date ()
        
        let comment = Comment(author: AppData.user,
                              comment: commentText!,
                              date: date)
        

            project.scriptComments.append(comment)
            self.scriptDelegate!.commentsUpdated()

        self.commentsTableView.reloadData()
        

        newCommentsTextView.text = "Add your comment"
        
        // NEW
        self.dismiss(animated: true, completion: nil)
    }
    
}
