import UIKit

extension Shotlist_VC
{
    @IBAction func popBack (_ sender: UIButton)
    {
        saveShots ()
        self.navigationController?.popViewController(animated: true)
    }
}
