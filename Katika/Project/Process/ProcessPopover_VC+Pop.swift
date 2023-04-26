import UIKit


extension ProcessPopover_VC
{
    class func pop (on viewCtrl: UIViewController)
    {
        let storyboard = UIStoryboard(name: "Process",
                                      bundle: nil)
        let popoverContent = storyboard.instantiateViewController(withIdentifier: "popoverRootVc") as! ProcessPopover_VC
        
        
        let nav = UINavigationController(rootViewController: popoverContent)
        nav.modalPresentationStyle = UIModalPresentationStyle.popover
        let popover = nav.popoverPresentationController
        
        nav.navigationBar.isHidden = true
        //        let navHeight = nav.navigationBar.bounds.height
        let heightOfView = viewCtrl.view.bounds.height
        let widthOfView = viewCtrl.view.bounds.width
        let popHeight = heightOfView / 2.0
        popoverContent.preferredContentSize = CGSize(width: 192,
                                                     height: popHeight)
        //        popover!.delegate = self
        popover?.sourceView = viewCtrl.view
        popover!.sourceRect = CGRect(x: widthOfView,
                                     y: 0,
                                     width: 0,
                                     height: heightOfView)
        
        popoverContent.processNavigateDelegate = viewCtrl as? ProcessNavigateDelegate
        
        
        popover!.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
        
        viewCtrl.present(nav, animated: true, completion: nil)
    }
}

