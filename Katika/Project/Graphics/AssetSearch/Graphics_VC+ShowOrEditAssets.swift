import UIKit
import PocketSVG

extension Graphics_VC
{
    @IBAction func showOrEditAssets (_ sender: UIButton)
    {
        if selected != nil
        {
            // edit
            popEditAssets (sender)
        }
        else
        {
            popAddAssets(sender)
        }
    }
}
