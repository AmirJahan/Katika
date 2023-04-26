import UIKit
import AVFoundation
import AVKit

class BreakApartVideo_VC: UIViewController
{
    @IBOutlet weak var watch_the_video_button: UIButton!
    @IBOutlet weak var intro_text: UITextView!

    @IBOutlet weak var replay_this_part: UIButton!

    @IBOutlet weak var part_2_main_parts_button: UIButton!
    @IBOutlet weak var part_3_script_button: UIButton!
    @IBOutlet weak var part_4_visuals_button: UIButton!
    
    // shot break apart menu
    @IBOutlet weak var shot1_button: UIButton!
    @IBOutlet weak var shot2_button: UIButton!
    @IBOutlet weak var shot3_button: UIButton!
    
    
    @IBOutlet weak var nav_button: UIButton!
    @IBOutlet weak var nav_label: UILabel!
    
    
    @IBOutlet weak var videoConinaterView: UIView!
    
    var current = ""
    
    var part_1 = "part_1_what_is"
    var part_2 = "part_2_main_parts"
    var part_3 = "part_3_script"
    var part_4 = "part_4_visuals"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        hideAllUI ()
        self.watch_the_video_button.alpha = 0.0
        UIView.animate(withDuration: 5.0) {
            self.watch_the_video_button.alpha = 1.0
        }
        watch_the_video_button.isHidden = false
        
        intro_text.alpha = 1.0
    }
    
    
    @IBAction func replay_this_video ()
    {
        self.play(current)
    }
    
    @IBAction func watchTheVideo ()
    {
        watch_the_video_button.isHidden = true
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.intro_text.alpha = 0.0
        }) { (res) in
            
            self.play (self.part_1)
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
    
    @IBAction func play_part_2_main_parts (_ sender: UIButton)
    {
        play (part_2)
    }
    
    
    @IBAction func play_part_3_script (_ sender: UIButton)
    {
        play (part_3)
    }
    
    @IBAction func play_part_4_visuals (_ sender: UIButton)
    {
        play (part_4)
    }
    
    
    func hideAllUI ()
    {
        self.replay_this_part.isHidden = true
        self.shot1_button.isHidden = true
        self.shot2_button.isHidden = true
        self.shot3_button.isHidden = true
        
        part_2_main_parts_button.isHidden = true
        part_3_script_button.isHidden = true
        part_4_visuals_button.isHidden = true
        
        nav_button.isHidden = true
        nav_label.isHidden = true
    }
    
    func showNavUI ()
    {
        nav_button.isHidden = false
        nav_label.isHidden = false
    }
    
    
    
    @objc func playerDidFinishPlaying ()
    {
        showNavUI ()
        
        if current == part_1
        {
            part_2_main_parts_button.isHidden = false
            self.replay_this_part.isHidden = false

        }
        else if current == part_2
        {
            part_3_script_button.isHidden = false
            self.replay_this_part.isHidden = false

        }
        else if current == part_3
        {
            part_4_visuals_button.isHidden = false
            self.replay_this_part.isHidden = false

        }else if current == part_4
        {
            shot1_button.isHidden = false
            shot2_button.isHidden = false
            shot3_button.isHidden = false
            self.replay_this_part.isHidden = false

        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?)
    {
        if segue.identifier == "toTrGraphicsSegue"
        {
            let vc : Tr_Graphics_VC = segue.destination as! Tr_Graphics_VC
            
            if sender as? UIButton == shot1_button
            {
                
                let imgsArr = [
                "s1_bg.png",
                "map.png",
                "green_pin.png",
                  "blue_pin.png",
                "s1_line.png",
                "line_2.png",

                "out_arrow.png",
                "mail.png",
                "video.png",
                "phone.png",

                "in_arrow.png"
  ]
                
                vc.imgsArr = imgsArr
            }
                
            else if sender as? UIButton == shot2_button
            {
                let imgsArr = [
                "s2_bg.png",
                    "s2_line.png",
                    "s2_right_circle.png",
                    "s2_left_circle.png",
                    "s2_woman.png",
                    "s2_man.png",
                    "s2_womanphone.png",
                    "s2_man_phone.png",
                    "s2_mid_circle.png",
                    "s2_left trust.png",
                    "s2_right_trust.png",
                    "s2_handshake.png"
                ]
                
                vc.imgsArr = imgsArr
                
            } else if sender as? UIButton == shot3_button
            {
                let imgsArr = [
                "s3_bg.png",
                "s3_map.png",
                "s3_right.png",
                "s3_left.png",
                "s3_coin.png",
                "s3_right_line.png",
                "s3_left_line.png",
                "s3_seal.png"
                ]
                
                vc.imgsArr = imgsArr
            }
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
