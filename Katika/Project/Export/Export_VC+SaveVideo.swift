import UIKit

extension Export_VC
{
    @IBAction func saveVideo ()
    {
        let alert = UIAlertController(title: "Saving",
                                      message: "Your video is being saved. Once it is done, you'll find it in the gallery", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}
