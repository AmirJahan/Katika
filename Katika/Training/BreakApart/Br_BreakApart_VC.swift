import UIKit

class Br_BreakApart_VC: UIViewController
{


    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
    }
    

    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }

}
