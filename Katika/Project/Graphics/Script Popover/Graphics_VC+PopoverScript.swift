import UIKit

extension Graphics_VC
{
    @IBAction func popoverScript (_ sender: UIButton)
    {
        let storyboard = UIStoryboard(name: "Script_Popover",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "scriptPopoverId") as! ScriptPopover_VC
        
//        vc.view.backgroundColor = .red
//        vc.scriptTextView.backgroundColor = .green
        vc.script = shot.script!
        
        vc.preferredContentSize = CGSize(width: 256,
                                         height: 256)
        
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
