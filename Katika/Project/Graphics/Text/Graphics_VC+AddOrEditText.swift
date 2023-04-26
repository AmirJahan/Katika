import UIKit


extension Graphics_VC
{
    @IBAction func addOrEditText (_ sender: UIButton)
    {
        if addTextMode
        {
            addText ()
        }
        else
        {
            popEditText (button: sender)
        }
        
    }
}
