import UIKit

class NavigateHelp
{
    class func toStep (training: TrainingStep,
                       from viewCtrl: UIViewController)
    {
        

        
        let storyboard = UIStoryboard(name: training.storyboard,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: training.vcId)
        

        
        viewCtrl.navigationController!.pushViewController(vc,
                                                          animated: true)
    }
}
