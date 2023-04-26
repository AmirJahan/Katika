import UIKit


class NavigateProcess
{
    class   func toProcess (to process: ProcessStep,
                            from vireCtrl: UIViewController)
    {
        let storyboard = UIStoryboard(name: process.storyboardName,
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: process.viewControllerId)
        vireCtrl.navigationController!.pushViewController(vc,
                                                          animated: true)
    }
    
    
    class func toStep (step: ProcessStep,
                       from viewCtrl: UIViewController)
    {
        let storyboard = UIStoryboard(name: step.storyboardName,
                                      bundle: nil)
        let targetViewCtrl = storyboard.instantiateViewController(withIdentifier: step.viewControllerId)
        
        let targetType = type(of: targetViewCtrl)
        
        for controller in viewCtrl.navigationController!.viewControllers as Array {
            if controller.isKind(of: targetType.self)
            {
                viewCtrl.navigationController!.popToViewController(controller, animated: true)
                return
            }
        }
        
        
        viewCtrl.navigationController!.pushViewController(targetViewCtrl,
                                                          animated: true)
    }
}
