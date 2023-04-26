import UIKit

class GraphicsComments_VC:
    UIViewController
{
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var newCommentsTextView: UITextView!
     
    var commentsDelegate: GraphicsCommentsDelegate?
    
    var shot: Shot?
    
    override func viewDidLoad()
    {
        self.navigationController?.navigationBar.isHidden = true
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
}
