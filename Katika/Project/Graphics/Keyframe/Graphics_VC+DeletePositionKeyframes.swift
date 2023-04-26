import UIKit


extension Graphics_VC
{
    @IBAction func deletePositionKeyframes ()
    {
        guard let sel = selected else { return }
        
        sel.xPositionKeyframes.removeAll()
        sel.yPositionKeyframes.removeAll()
        
        sel.xPositionframes.removeAll()
        sel.yPositionframes.removeAll()
    }
}
