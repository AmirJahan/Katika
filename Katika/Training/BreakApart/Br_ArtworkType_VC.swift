import UIKit

class Br_ArtworkType_VC: UIViewController
{
    @IBAction func comeBackTo_Br_ArtworkType(_ unwindSegue: UIStoryboardSegue) {}

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }

}
