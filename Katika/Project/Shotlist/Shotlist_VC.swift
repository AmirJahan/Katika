import UIKit
import Speech

class Shotlist_VC: UIViewController
{
    @IBOutlet weak var shotsCollectionView: UICollectionView!
    @IBOutlet weak var editShotsButton: UIButton!

    @IBOutlet weak var continueButton: UIButton!

    
    // comments
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var commentsBadge: UILabel!
    
    let minLengthOfSentence: Int = 12
    var helpBarButton : UIBarButtonItem!
    var popover = ProcessSidebar_VC()
    
    var textEditingMode: Bool = false
      

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        getSpeechAuthorization ()

        makeShots ()
        
        // TODO: this is not currently working. We'll make it work LATER
//        findInsAndOuts()
        
        shotsCollectionView.scrollToItem(at: IndexPath(item: 0,
                                                       section: 0),
                                         at: UICollectionView.ScrollPosition.left,
                                         animated: false)
        
        let lpgr =
            UILongPressGestureRecognizer(target: self,
                                         action: #selector(handleLongPress))
        
        self.shotsCollectionView.addGestureRecognizer(lpgr)
        
        loadComments ()

    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        prepareCollectionView ()
        
        prepareProcess ()
    }
}
