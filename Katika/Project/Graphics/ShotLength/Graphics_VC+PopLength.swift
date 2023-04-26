import UIKit

extension Graphics_VC
{
    @IBAction func showLength (_ sender: UIButton)
    {
        
        
//        let tempAlert = UIAlertController(title: "No Need",
//                                          message: "Length of the shot has already been calculated for you",
//                                          preferredStyle: UIAlertController.Style.alert)
//        
//        tempAlert.addAction(UIAlertAction(title: "Ok",
//                                          style: UIAlertAction.Style.default, handler: nil))
//        
//        self.present(tempAlert, animated: true, completion: nil)
//        
//        return
 
        
        
        
        
        let storyboard = UIStoryboard(name: "ShotLength",
                                      bundle: nil)
        let vc = storyboard
            .instantiateViewController(withIdentifier: "rootVc") as! ShotLength_VC
        
        
        for vo in AppData.curProject!.voiceOvers
        {
            if vo.selected
            {
                var start : Float = 0.0
                var end : Float = 5.0
                if shotIndex != 0
                {
                    start = shot.startTime!
                }
                
                if let dur = shot.duration
                {
                    end = start + dur
                }
                else
                {
                    end = start + 5.0
                }
                

                if end > vo.duration
                {
                    end = vo.duration
                }
                
                if shotIndex == (AppData.curProject?.shots.count)! - 1
                {
                    end = vo.duration
                }
                
                print ("start is: \(start)")
                print ("end is: \(end)")
                print ("duration is: \(vo.duration)")

                
                // TODO: 
                vc.currentStart = start
                vc.currentEnd = end
                vc.currentMax = vo.duration
            }
        }

        vc.preferredContentSize = CGSize(width: 512,
                                         height: 128)
        
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
        
        vc.lengthSlider.delegate = self

    }
}
