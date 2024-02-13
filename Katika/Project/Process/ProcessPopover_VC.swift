import UIKit

class ProcessPopover_VC: UIViewController {
    @IBOutlet weak var processesTableView: UITableView!

    var processNavigateDelegate: ProcessNavigateDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        processesTableView.delegate = self
        processesTableView.dataSource = self
    }
}
