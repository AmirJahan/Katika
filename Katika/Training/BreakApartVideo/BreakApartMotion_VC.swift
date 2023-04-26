import UIKit
import AVFoundation
import AVKit

class BreakApartMotion_VC: UIViewController
{
    @IBOutlet weak var watch_the_motion_video_button: UIButton!
    @IBOutlet weak var what_is_motion_intro_text: UITextView!

    
    @IBOutlet weak var transition_button: UIButton!

    @IBOutlet weak var finished_button: UIButton!

    
    @IBOutlet weak var nav_button: UIButton!
    @IBOutlet weak var nav_label: UILabel!
    
    
    @IBOutlet weak var videoConinaterView: UIView!
    
    var current = ""
    
    var part_6 = "part_6_motion"
    var part_7 = "part_7_transition"

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        hideAllUI ()
        
        self.watch_the_motion_video_button.alpha = 0.0
        UIView.animate(withDuration: 5.0) {
            self.watch_the_motion_video_button.alpha = 1.0
        }
        watch_the_motion_video_button.isHidden = false
        
        what_is_motion_intro_text.alpha = 1.0
    }
    
    
    @IBAction func watchTheVideo ()
    {
        watch_the_motion_video_button.isHidden = true
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.what_is_motion_intro_text.alpha = 0.0
        }) { (res) in
            
            self.play (self.part_6)
        }
    }
    
    
    func play (_ part: String)
    {
        current = part
        hideAllUI ()
        let url : URL = Bundle.main.url(forResource: current,
                                        withExtension: "mp4")!
        
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        videoConinaterView.layer.addSublayer(playerLayer)
        
        NotificationCenter
            .default
            .addObserver(self,
                         selector: #selector(playerDidFinishPlaying),
                         name: .AVPlayerItemDidPlayToEndTime,
                         object: nil)
        
        player.play()
    }
    
    @IBAction func play_part_7_transition (_ sender: UIButton)
    {
        play (part_7)
    }
    
     
    func hideAllUI ()
    {
        watch_the_motion_video_button.isHidden = true
        transition_button.isHidden = true
        
        nav_button.isHidden = true
        nav_label.isHidden = true
        finished_button.isHidden = true
    }
    
    func showNavUI ()
    {
        nav_button.isHidden = false
        nav_label.isHidden = false
    }
    
    
    
    @objc func playerDidFinishPlaying ()
    {
        showNavUI ()
        
        if current == part_6
        {
            transition_button.isHidden = false
        }
       else if current == part_7
        {
            finished_button.isHidden = false
        }
        
    }
    
    
    
    
    
    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func gotoShotBreakDown (_ sender: UIButton)
    {
        performSegue(withIdentifier: "toTrGraphicsSegue",
                     sender: sender)
    }
}
