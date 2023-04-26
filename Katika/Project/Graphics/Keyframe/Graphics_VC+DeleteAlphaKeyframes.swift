import UIKit


extension Graphics_VC
{
    @IBAction func deleteAlphaKeyframes ()
    {
        guard let sel = selected else { return }
        
        sel.alphaKeyframes.removeAll()
        sel.alphaFrames.removeAll()
    }
}
