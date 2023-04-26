import UIKit
import PocketSVG
import AVFoundation
import Colorful

class Graphics_VC: UIViewController
{
    @IBOutlet weak var bgColorPicker: UIButton!
    
    @IBOutlet weak var popBackButton: UIButton!
    @IBOutlet weak var lockButton: UIButton!
    
    @IBOutlet weak var positionKeyframeButton: UIButton!
    @IBOutlet weak var rotationKeyframeButton: UIButton!
    @IBOutlet weak var scaleKeyframeButton: UIButton!
    @IBOutlet weak var alphaKeyframeButton: UIButton!
    
    @IBOutlet weak var deletePositionKeyframeButton: UIButton!
    @IBOutlet weak var deleteRotationKeyframeButton: UIButton!
    @IBOutlet weak var deleteScaleKeyframeButton: UIButton!
    @IBOutlet weak var deleteAlphaKeyframeButton: UIButton!
    
    // this is for miving the objects around
    var initialCenter = CGPoint()
    
    
    // comments
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var commentsBadge: UILabel!
    @IBOutlet weak var suggestionsBadge: UILabel!
    @IBOutlet weak var endSuggestionsButton: UIButton!
    @IBOutlet weak var suggestionsCommentTextField: UITextField!
    
    
    
    
    @IBOutlet weak var showOrEditAssetButton: UIButton!
    @IBOutlet weak var showOrEditImageButton: UIButton!
    
    
    @IBOutlet weak var animateButton: UIButton!
    var animationMode = false
    
    @IBOutlet weak var makeOrEditTextButton: UIButton!
    var addTextMode = true
    
    
    @IBOutlet weak var deleteArtworkButton: UIButton!
    
    
    @IBOutlet var mainCanvas: UIView!
    
    @IBOutlet weak var shotSlider: UISlider!
    
    
    var player: AVAudioPlayer?
    var playMode = false
    @IBOutlet weak var playPauseButton: UIButton!
    var playTime: Float = 0.0
    var playTimer: Timer?
    
    @IBOutlet weak var shotEndLabel: UILabel!
    
    var embeddedShotsVc: ShotsEmbedded_VC?
    
    var bottomConstraint: NSLayoutConstraint!
    
    var shotIndex: Int!
    var shot: Shot! = nil
    
    
    var processPopover = ProcessSidebar_VC()
    
    var selected : Artwork?
    
    var suggestionMode = false
    //    var weAreOnMainShot = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        loadShotAtViewDidLoad ()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        loadShotAtViewWillAppear ()
    }
    
        
    func loadShotAtViewDidLoad ()
    {
        
        endSuggestionsButton.isHidden = true
        suggestionsCommentTextField.isHidden = true
        
        
        // set true to be able to hide the buttons
        animationMode = true
        setAnimationMode ()
        
        shot = AppData.curProject?.shots[shotIndex]
        
        
        // set only if shot duration has been decided for
        if let duration = shot.duration
        {
            shotSlider.maximumValue = duration
            shotEndLabel.text = "00\""
            shotSlider.value = 0.0
        }
        
        
        DispatchQueue.global(qos: .background).async
            {
                self.prepareForPlay ()
                
        }
        
        MakeFrames.makeAllFrames(shot: shot, transitionLength: 0.0)
        
        
        addEmbeddedShots ()
        
        if let sht = shot {
            updateBackgroundColor(with: sht.bgColor)
        }
        
        
        hideDeleteButton ()
        
        
        loadArtworks()
        
        
        addTapOnCanvas ()
        
        
        loadComments ()
        loadSuggestions ()
    }
    
    
    func loadShotAtViewWillAppear ()
    {
        setLockedMode ()
    }
}








