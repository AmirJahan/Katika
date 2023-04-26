import UIKit

class CollaborateViewController: UIViewController
{
    var hostViewController: UIViewController?
    
    @IBOutlet var containerView: UIView! 
    
    var navViewController: UINavigationController?
    var shot: Shot?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toNavSegId"
        {
            navViewController = segue.destination as? UINavigationController
            
            let commentsVc = navViewController!.viewControllers.first as? GraphicsComments_VC
            
            commentsVc?.shot = shot!
            
            commentsVc?.commentsDelegate = hostViewController! as? GraphicsCommentsDelegate
        }
    }
    
    
    @IBAction func switchSegment(_ sender: UISegmentedControl)
    {
        let seg = sender.selectedSegmentIndex
        
        if seg == 0
        {
            navViewController?.popToRootViewController(animated: true)
        }
        else if seg == 1
        {
            let storyboard = UIStoryboard(name: "GraphicsColaborate",
                                          bundle: nil)
            
            let vc = storyboard.instantiateViewController(withIdentifier: "GraphicsSuggestions_VC") as! GraphicsSuggestions_VC
            
            vc.shot = shot!
            vc.suggestionDelegate = hostViewController! as? SuggestionDelegate
            
            navViewController?.pushViewController(vc, animated: true)
        }
    }
}
