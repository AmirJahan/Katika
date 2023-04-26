import UIKit

class Help_VC: UIViewController
{
    var helpDelegate : HelpDelegate!
    var curStep: ProcessStep!
    @IBOutlet weak var trainingsTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        trainingsTableView.delegate = self
        trainingsTableView.dataSource = self
    }
}

extension Help_VC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int
    {
        curStep.trainings!.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "helpCellId")!
        
        let thisTraining = curStep.trainings![indexPath.row]
        
        cell.textLabel!.text = thisTraining.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath)
    {
        let training = curStep.trainings![indexPath.row]
        
        
        self.helpDelegate.navigateToTraining(training: training)
        print ("calling \(training.title) from table view")
    }
}


extension Help_VC
{
    class func popoverHelp (to viewCtrl: UIViewController,
                            at helpButton: UIButton,
                            for processStep: ProcessStep)
    {
        let storyboard = UIStoryboard(name: "Help_Popover",
                                      bundle: nil)
        let popover = storyboard.instantiateViewController(withIdentifier: "rootVc") as! Help_VC
        
        popover.curStep = processStep
        
        popover.helpDelegate = viewCtrl as? HelpDelegate
        //
        //
        //            let popover = ContextVC()
        popover.preferredContentSize = CGSize(width: 384,
                                              height: 384)
        popover.modalPresentationStyle = .popover
        if let presentation = popover.popoverPresentationController
        {
            presentation.sourceView = helpButton
        }
        viewCtrl.present(popover,
                         animated: true,
                         completion: nil)
    }
}
