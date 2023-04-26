import UIKit

class Welcome_VC: UIViewController
{
    @IBAction func comeBackToWelcome(_ unwindSegue: UIStoryboardSegue) {}
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        askForName ()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func breakApart (_ sender: UIButton?)
    {
        let training = Training.breakApartVideo
        let storyBoardName = training.storyboard
        let id =  training.vcId
        
        let storyboard = UIStoryboard(name: storyBoardName,
                                      bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: id) as! BreakApartVideo_VC
        
        self.navigationController?.pushViewController(vc,
                                                      animated: true)
    }
    
    @IBAction func changeUser ()
    {
        askForName()
    }
    
    func askForName() {
        
        let alert = UIAlertController(title: "Name",
                                      message: "Please enter a name such as P1, P2, P3, or similar.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addTextField { (txtFld) in
            txtFld.font = UIFont.systemFont(ofSize: 22)
            txtFld.textAlignment = .center
            txtFld.placeholder = "Name"
        }
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: UIAlertAction.Style.default,
                                      handler:
            { (aler) in
                
                var name = alert.textFields![0].text
                
                if name == ""
                {
                    name = "Amir"
                }
                
                let user = User(name: name!)
                
                AppData.user = user
                
                
                if (name?.lowercased().contains("p"))!
                {
                    self.breakApart(nil)
                }
        }))
        
        self.present(alert,
                     animated: true, completion: nil)
    }
}
