import UIKit

extension ExportComments_VC {
    @IBAction func addNewComment(_ sender: UIButton) {
        guard let project = AppData.curProject else { return }

        let commentText = newCommentsTextView.text

        if commentText == "" { return }

        let date = Date()

        let videoComment = VideoComment(author: AppData.user,
                              comment: commentText!,
                              date: date,
                              time: time)

        project.videoComments.append(videoComment)
        self.exportDelegate!.commentsUpdated()

        self.commentsTableView.reloadData()

        newCommentsTextView.text = "Add your comment"

        // because we are in Shot List, there really isn't
        // a point wher we save the project. So we should
        // save it here.
        ReadWrite.write()

        // NEW
        self.dismiss(animated: true, completion: nil)
    }
}
