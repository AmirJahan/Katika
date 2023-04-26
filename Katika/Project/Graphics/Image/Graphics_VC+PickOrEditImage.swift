import UIKit

extension Graphics_VC
{
    @IBAction func pickOrEditImage (_ sender: UIButton)
    {
        if selected != nil
        {
            
            // edit
            popEditImage (sender)
        }
        else
        {
            pickImage (sender)
        }
    }
    
}
