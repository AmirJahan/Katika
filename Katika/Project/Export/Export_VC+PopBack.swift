import UIKit

extension Export_VC
{
    @IBAction func popBack (_ sender: UIButton)
    {
        stopPlay ()
        self.navigationController?.popViewController(animated: true)
    }
}
