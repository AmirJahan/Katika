import UIKit


extension Graphics_VC
{
    @IBAction func deleteScaleKeyframes ()
    {
        guard let sel = selected else { return }
        
        sel.xScaleKeyframes.removeAll()
        sel.yScaleKeyframes.removeAll()
        
        sel.xScaleframes.removeAll()
        sel.yScaleframes.removeAll()
    }
}
