import UIKit

extension Shotlist_VC
{
    func weBeganRcognizing ()
    {
        //create an alert controller
        let pending = UIAlertController(title: "Creating Shotlist",
                                        message: "The app is currently building your shots. You can keep working while this process happens in the background. We'll update you when the process is finished." ,
                                        preferredStyle: .alert)
        
        pending.addAction(UIAlertAction(title: "Ok",
                                        style: UIAlertAction.Style.default,
                                        handler: nil))
        
        
        self.present(pending,
                     animated: true,
                     completion: nil)
    }
    
    func weFinishedRcognizing ()
    {
        //create an alert controller
        let pending = UIAlertController(title: "Shotlist Complete",
                                        message: "All shots are now ready and the voiceover has been matched to them." ,
                                        preferredStyle: .alert)
        
        pending.addAction(UIAlertAction(title: "Ok",
                                        style: UIAlertAction.Style.default,
                                        handler: nil))
        
        topMostController()?.present(pending,
                     animated: true,
                     completion: nil)
    }
    
    func topMostController() -> UIViewController? {
//        UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        
        
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first, let rootViewController = window.rootViewController else {
            return nil
        }

        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }

        return topController
    }
}
