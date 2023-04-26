import UIKit
import AVFoundation

class Export_VC: UIViewController
{
    @IBOutlet var mainCanvas: UIView!
    @IBOutlet weak var playOrStopButton: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    
    
    // comments
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var commentsBadge: UILabel!
    
    
    var transitionTime: Float = 1.5
    
    var selectedVo : Voiceover!
    
    var player: AVAudioPlayer?
    
    var playTimer: Timer!
    var playTime: Float = 0.0
    
    var noVoiceover = true
    var popover = ProcessSidebar_VC()
    
    var playing = false
    
    var curShotIndex : Int = 0
    var nextShotTime : Float = 0.0
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
     loadComments ()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {    
        super.viewWillAppear(true)
        
        setShot(animated: false)
        
        for each in mainCanvas.subviews
        {
            each.frame = mainCanvas.bounds
        }
        
        checkVoiceover()
        playOrStopButton.isEnabled = false
        DispatchQueue.global(qos: .background).async
            {
                self.prepareForplay()
                
                DispatchQueue.main.async
                    {
                        self.playOrStopButton.isEnabled = true
                }
        }
        
        prepareProcess ()
    }
}
