import UIKit


extension Graphics_VC
{
    func popEditText (button: UIButton)
    {
        let storyboard = UIStoryboard(name: "TextEditor",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "rootVc") as! TextEditor_VC
        
        
        vc.delegate = self
        
        if let txt = selected?.textView
        {
            vc.startColor = txt.textColor!
            vc.textSize = Float (txt.font!.pointSize)

            vc.textAlpha = Float(txt.alpha)
        }
        
        
        vc.preferredContentSize = CGSize(width: 384,
                                         height: 512)
        
        vc.modalPresentationStyle = .popover
        if let pres = vc.presentationController
        {
            pres.delegate = self
        }
        self.present(vc, animated: true)
        if let pop = vc.popoverPresentationController
        {
            pop.sourceView = (button as UIView)
            pop.sourceRect = (button as UIView).bounds
        }
    }
}


