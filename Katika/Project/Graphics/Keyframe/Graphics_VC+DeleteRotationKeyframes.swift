import UIKit


extension Graphics_VC
{
    @IBAction func deleteRotationKeyframes ()
    {
        guard let sel = selected else { return }
        
        sel.rotationKeyframes.removeAll()
        sel.rotationFrames.removeAll()
    }
}
