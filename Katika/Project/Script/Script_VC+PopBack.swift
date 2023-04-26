import UIKit

extension Script_VC
{
    @IBAction func popBack (_ sender: UIButton)
    {
        saveTitle ()
        
        saveScript()
        
        
        
        
        
        stopPlayBack ()
        self.navigationController?.popViewController(animated: true)
    }
}
