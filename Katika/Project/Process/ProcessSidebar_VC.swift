import UIKit

class ProcessSidebar_VC: UIViewController,
    UITableViewDelegate,
    UITableViewDataSource {
    var processPopoverDelegate: SidebarProcessDelegate!

    @IBOutlet weak var processesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        processesTableView.delegate = self
        processesTableView.dataSource = self

        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(popIt))
        self.view.addGestureRecognizer(tapGesture)
    }
}

extension ProcessSidebar_VC {
    @objc func popIt() {
        processPopoverDelegate.popItOver()
    }
}

extension ProcessSidebar_VC {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return Process.steps.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "processCell") as! ProcessSidebarItemTableViewCell

        let step = Process.steps[indexPath.row]

        if indexPath.row == 0 {
            cell.topView.isHidden = true
        } else if indexPath.row == Process.steps.count - 1 {
            cell.bottomView.isHidden = true
        }

        cell.acronymLabel.text = step.levelAcronym.rawValue

        cell.acronymLabel.layer.cornerRadius = cell.acronymLabel.bounds.width / 2.0
        cell.acronymLabel.clipsToBounds = true
        if step.selected {
            cell.acronymLabel.backgroundColor = UIColor.primary
            cell.acronymLabel.textColor = UIColor.white
        } else {
            cell.acronymLabel.textColor = UIColor.primary
            cell.acronymLabel.backgroundColor = UIColor.white
            cell.acronymLabel.layer.borderColor = UIColor.primary.cgColor
            cell.acronymLabel.layer.borderWidth = 2.0
        }

        return cell
    }

    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / CGFloat(Process.steps.count)
    }

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
    }
}
