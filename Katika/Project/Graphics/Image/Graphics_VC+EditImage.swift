import UIKit
import PocketSVG

extension Graphics_VC
{
    func findCurrentImageAlpha () -> Float
    {
        guard let sel = selected else { return 1.0}
        
        var alpha : Float = 0.0
        if let svg = sel.imageView
        {
            alpha = Float(svg.alpha)
        }
        return alpha
    }
    
    func popEditImage (_ sender: UIButton)
    {
        let storyboard = UIStoryboard(name: "ImageEditor",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "rootVc") as! ImageEditor_VC
        
        vc.delegate = self
        
        let currentAlpha = findCurrentImageAlpha ()
        
        vc.alpha = currentAlpha
        
        vc.preferredContentSize = CGSize(width: 384,
                                         height: 192)
        
        vc.modalPresentationStyle = .popover
        if let pres = vc.presentationController
        {
            pres.delegate = self
        }
        self.present(vc, animated: true)
        if let pop = vc.popoverPresentationController
        {
            pop.sourceView = (sender as UIView)
            pop.sourceRect = (sender as UIView).bounds
        }
    }
}

extension Graphics_VC: ImageEditorDelegate
{
    func changeImageAlpha(value: Float)
    {
        guard let sel = selected else { return}
        
        if let img = sel.imageView
        {
            img.alpha = CGFloat(value)
        }
    }
}
