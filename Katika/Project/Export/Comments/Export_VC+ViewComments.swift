import UIKit

extension Export_VC: UIAdaptivePresentationControllerDelegate {
    @IBAction func viewCommentss(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ExportComments",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "commentsVcId") as! ExportComments_VC

        vc.project = AppData.curProject
        vc.time = playTime

        print("sent time is: \(playTime)")

        vc.exportDelegate = self

        vc.preferredContentSize = CGSize(width: 384,
                                         height: 512)

        vc.modalPresentationStyle = .popover
        if let pres = vc.presentationController {
            pres.delegate = self
        }
        self.present(vc, animated: true)
        if let pop = vc.popoverPresentationController {
            pop.sourceView = (sender as UIView)
            pop.sourceRect = (sender as UIView).bounds
        }
    }
}
