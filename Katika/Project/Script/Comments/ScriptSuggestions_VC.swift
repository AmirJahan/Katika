import UIKit

class ScriptComments_VC:
    UIViewController
{
    @IBOutlet weak var scriptSuggestionsTableView: UITableView!
    
    var delegate: ScriptSuggestionDelegate!
    var project: Project?
    
    override func viewDidLoad()
    {
        scriptSuggestionsTableView.delegate = self
        scriptSuggestionsTableView.dataSource = self
    }
}
