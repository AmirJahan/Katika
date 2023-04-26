import UIKit

class Tr_Definition_End_VC: UIViewController
{

    @IBAction func goHome (_ sender: UIButton)
    {
        
        self.dismiss(animated: true, completion: nil)
        
//        self.navigationController?.navigationBar.isHidden = true
//        
//        for controller in self.navigationController!.viewControllers as Array {
//            if controller.isKind(of: Home_VC.self) {
//                self.navigationController!.popToViewController(controller, animated: true)
//                return
//            }
//        }
//        
//        self.navigationController?.popToRootViewController(animated: true)
    }
}
