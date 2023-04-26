import Foundation
import UIKit

protocol HelpDelegate
{
    func navigateToTraining (training: TrainingStep)
}


//func pushToHelp(popover: UIViewController,
//                fromView: UIViewController)
//{
//    popover.dismiss(animated: true,
//                    completion:
//        {
//            for level in Process.steps
//            {
//                if level.selected
//                {
//                    let training = level.trainings![0]
//                    let storyboard = UIStoryboard(name: training.trainingSb,
//                                                  bundle: nil)
//                    let vc = storyboard.instantiateViewController(withIdentifier: "MainVC")
//
//                    fromView.navigationController?.pushViewController(vc,
//                                                                  animated: true)
//                }
//            }})
//}
