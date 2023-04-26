import UIKit

class ShotlistComments_VC:
    UIViewController
{
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var newCommentsTextView: UITextView!
    
    var shotlistDelegate: ShotlistCommentsDelegate?
    
    var project: Project?
    
    override func viewDidLoad()
    {
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
}
