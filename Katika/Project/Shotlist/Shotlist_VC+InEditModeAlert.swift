import UIKit

extension Shotlist_VC
{
    func youAreInEditMode ()
    {
        let alert = UIAlertController(title: "You are in shot editing mode",
                                      message: "Please finish the shot editing mode before you navigate away from this view.",
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
