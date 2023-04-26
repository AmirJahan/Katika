import UIKit

extension Graphics_VC
{
    @IBAction func popBack (_ sender: UIButton)
    {

        clearSelection ()
        
        readyShotForSave ()
        
        
        ReadWrite.write()
        
        stop ()
        
        
        self.navigationController?.popViewController(animated: true)
    }
}
