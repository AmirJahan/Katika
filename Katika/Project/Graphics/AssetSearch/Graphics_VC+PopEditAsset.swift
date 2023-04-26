import UIKit
import PocketSVG

extension Graphics_VC
{
    func findCurrentAlpha () -> Float
    {
        guard let sel = selected else { return 1.0}
        
        var alpha : Float = 0.0
        if let svg = sel.svgImgView
        {
            alpha = Float(svg.alpha)
        }
        return alpha
    }
    
    func popEditAssets (_ sender: UIButton)
    {
        let storyboard = UIStoryboard(name: "AssetEditor",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "rootVc") as! AssetEditor_VC
        
        vc.delegate = self
        
        let currentAlpha = findCurrentAlpha ()
        
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

extension Graphics_VC: AssetEditorDelegate
{
    func changeAlpha(value: Float)
    {
        guard let sel = selected else { return}
        
        if let svg = sel.svgImgView
        {
            svg.alpha = CGFloat(value)
        }
    }
}
