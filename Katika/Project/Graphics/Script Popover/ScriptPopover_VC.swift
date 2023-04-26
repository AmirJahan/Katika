import UIKit

class ScriptPopover_VC: UIViewController {

    @IBOutlet weak var scriptTextView: UITextView!
    @IBOutlet weak var coreIdeasCollectionView: UICollectionView!
    let labelsFont: UIFont = UIFont(name: "Menlo", size: 14.0)!

    var script = ""
    
    override func viewDidLoad()
    {
        scriptTextView.text = script
    }
}
