import UIKit
import PocketSVG

extension Graphics_VC
{
    func popAddAssets (_ sender: UIButton)
    {
        let storyboard = UIStoryboard(name: "AssetSearch",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "rootVc") as! AssetSearch_VC
        
        vc.delegate = self

        
        vc.preferredContentSize = CGSize(width: 512,
                                         height: 768)
        
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
