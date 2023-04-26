import UIKit

class ShotsEmbedded_VC: UIViewController
{
    @IBOutlet weak var shotsCollectionView: UICollectionView!

    var delegate : EmbeddedShotsDelegate!
    var tap: UITapGestureRecognizer!
    var large = false
    var currentShot: Int!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.prepareCollectionView ()
        
        
        self.shotsCollectionView.isUserInteractionEnabled = true
        
        tap = UITapGestureRecognizer(target: self,
                                         action: #selector(tappedMainView))
        self.view.addGestureRecognizer(tap)
    }
}


extension ShotsEmbedded_VC
{
    @objc
    func tappedMainView ()
    {
        var height = 0
        if !large
        {
            large = true
            height = 0
            
            
            self.view.removeGestureRecognizer(tap)
            let seconds = 4.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds)
            {
                // Put your code which should be executed with a delay here
                self.view.addGestureRecognizer(self.tap)
                self.large = false
                height = 56
                self.delegate.changeHeight(height: height)
            }
        }
        self.delegate.changeHeight(height: height)
    }
}
