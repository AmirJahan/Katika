import UIKit

extension Graphics_VC: UIAdaptivePresentationControllerDelegate
{
    @IBAction func viewCollaboration (_ sender: UIButton)
       {

        let storyboard = UIStoryboard(name: "GraphicsColaborate",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CollaborateViewController") as! CollaborateViewController
                vc.shot = shot

        vc.hostViewController = self
        
        vc.preferredContentSize = CGSize(width: 256,
                                         height: 512)
        
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
