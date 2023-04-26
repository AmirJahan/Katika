import UIKit

class ScriptComments_VC:
    UIViewController
{
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var newCommentsTextView: UITextView!
    

    var scriptDelegate: ScriptCommentsDelegate?
    
    var project: Project?
    
    override func viewDidLoad()
    {
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
}
