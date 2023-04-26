import UIKit

class ExportComments_VC:
    UIViewController
{
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var newCommentsTextView: UITextView!
    
    var exportDelegate: ExportCommentsDelegate?
    
    var time: Float = 0.0
    
    var project: Project?
    
    override func viewDidLoad()
    {
        print ("received time is: \(time)")

        commentsTableView.delegate = self
        commentsTableView.dataSource = self
    }
}
