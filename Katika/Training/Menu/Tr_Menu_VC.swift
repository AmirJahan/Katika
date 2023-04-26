import UIKit

class Tr_Menu_VC: UIViewController,
    UITableViewDelegate,
    UITableViewDataSource
{
    @IBOutlet weak var trainingsTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true

        trainingsTableView.dataSource = self
        trainingsTableView.delegate = self
        
        self.trainingsTableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true

        
        for i in 0..<Training.trainings.count
        {
            let ip = IndexPath(row: i, section: 0)
            trainingsTableView.deselectRow(at: ip,
                                           animated: false)
        }
    }
    
    
}
