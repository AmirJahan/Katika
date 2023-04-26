import UIKit
import AVFoundation
import AVKit

class Br_DividedVideo_VC: UIViewController
{
    var player1: AVPlayer?
    
    @IBOutlet weak var part_1_label: UILabel!
    @IBOutlet weak var part_2_label: UILabel!
    @IBOutlet weak var part_3_label: UILabel!
    @IBOutlet weak var part_4_label: UILabel!
    
    
    @IBOutlet weak var choose_to_continue_Label: UILabel!

    
    @IBOutlet weak var shot_1_container: UIView!
    @IBOutlet weak var shot_2_container: UIView!
    @IBOutlet weak var shot_3_container: UIView!
    @IBOutlet weak var shot_4_container: UIView!
    
    
    @IBOutlet weak var shot_1_button: UIButton!
    @IBOutlet weak var shot_2_button: UIButton!
    @IBOutlet weak var shot_3_button: UIButton!
    @IBOutlet weak var shot_4_button: UIButton!
    
    
    @IBAction func gotoShot (_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "shotVideoSegue",
                          sender: sender)
    }
    
    
    @IBOutlet weak var slider: UISlider!
    var sliderVal : Float = 0.0
    var videoRate : Float = 4.0
    
    var slideTimer : Timer?
    
    let end_shot_1_time: Float = 13.0
    let end_shot_2_time: Float = 9.0
    let end_shot_3_time: Float = 17.0
    let end_shot_4_time: Float = 16.0
    
    
    var shot_1_animated = false
    var shot_2_animated = false
    var shot_3_animated = false
    var shot_4_animated = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        pushVideosUp ()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        slider.maximumValue = end_shot_1_time + end_shot_2_time + end_shot_3_time + end_shot_4_time
        
        slider.value = 0
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?)
    {
        if segue.identifier == "mainVideoSegue"
        {
            let url : URL = Bundle.main.url(forResource: "Blockchain_Short_Sped",
                                            withExtension: "mp4")!
            player1 = AVPlayer(url: url)
            //            player1?.rate = 4.0
            let avCtrl = segue.destination as? AVPlayerViewController
            avCtrl!.player = player1
            
            NotificationCenter
                .default
                .addObserver(self,
                             selector: #selector(playerDidFinishPlaying),
                             name: .AVPlayerItemDidPlayToEndTime,
                             object: nil)
            
            player1?.addObserver(self, forKeyPath: "rate",
                                 options: NSKeyValueObservingOptions.new,
                                 context: nil)
            
            part_1_label.text = "Part 1: \(end_shot_1_time) seconds"
            part_2_label.text = "Part 2: \(end_shot_2_time) seconds"
            part_3_label.text = "Part 3: \(end_shot_3_time) seconds"
            part_4_label.text = "Part 4: \(end_shot_4_time) seconds"
        }
        else
        {
            player1?.pause()
            if slideTimer != nil
            {
                slideTimer?.invalidate()
            }
            
            if segue.identifier == "shotVideoSegue"
            {
                let vc = segue.destination as! Br_SingleShot_VC
                
                let button = sender as! UIButton
                
                switch button {
                case shot_1_button:
                    vc.shotName = "Blockchain_Shot_1"
                case shot_2_button:
                    vc.shotName = "Blockchain_Shot_2"
                case shot_3_button:
                    vc.shotName = "Blockchain_Shot_3"
                default:
                    vc.shotName = "Blockchain_Shot_4"
                    
                }
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?)
    {
        guard let player = player1 else { return }
        
        if keyPath == "rate"
        {
            if player.rate > 0
            {
                self.beginSliding ()
            }
        }
    }
    
    func beginSliding ()
    {
        if slideTimer != nil
        {
            slideTimer!.invalidate ()
            pushVideosUp ()
        }
        
        slideTimer =  Timer.scheduledTimer(timeInterval: 0.1,
                                           target: self,
                                           selector: #selector(slideIt),
                                           userInfo: nil,
                                           repeats: true)
        
        showShot(cont: shot_1_container)
        shot_1_animated = true
    }
    
    func showShot (cont: UIView)
    {
        UIView.animate(withDuration: 0.5) {
            cont.alpha = 1.0
        }
        
        UIView.animate(withDuration: 3.0)
        {
            cont.center
                = CGPoint(x: cont.center.x,
                          y: cont.center.y + 50)
        }
    }
    
    func pushVideosUp ()
    {
        shot_1_container.center = CGPoint(x: shot_1_container.center.x,
                                          y: shot_1_container.center.y - 50)
        shot_2_container.center = CGPoint(x: shot_2_container.center.x,
                                          y: shot_2_container.center.y - 50)
        shot_3_container.center = CGPoint(x: shot_3_container.center.x,
                                          y: shot_3_container.center.y - 50)
        shot_4_container.center = CGPoint(x: shot_4_container.center.x,
                                          y: shot_4_container.center.y - 50)
        shot_1_container.alpha = 0.0
        shot_2_container.alpha = 0.0
        shot_3_container.alpha = 0.0
        shot_4_container.alpha = 0.0
        
        choose_to_continue_Label.isHidden = true
    }
    
    @objc
    
    func slideIt ()
    {
        sliderVal += 0.1 * videoRate
        
        if sliderVal <= slider.maximumValue
        {
            slider.value = sliderVal
            showNextShot (time: sliderVal)
        }
        else
        {
            slideTimer!.invalidate()
        }
    }
    
    func showNextShot (time: Float)
    {
        if time > end_shot_1_time && !shot_2_animated
        {
            showShot(cont: shot_2_container)
            shot_2_animated = true
            
        } else if time > end_shot_2_time + end_shot_1_time && !shot_3_animated
        {
            showShot(cont: shot_3_container)
            shot_3_animated = true
        } else if time > end_shot_3_time + end_shot_2_time + end_shot_1_time && !shot_4_animated
        {
            showShot(cont: shot_4_container)
            shot_4_animated = true
            choose_to_continue_Label.isHidden = false
        }
    }
    
    @objc func playerDidFinishPlaying ()
    {
        
    }
    
    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
}
