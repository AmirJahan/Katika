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

    @IBOutlet weak var slider: UISlider!
    var sliderVal : Float = 0.0

    var slideTimer = Timer()
    
    let end_shot_1_time: Float = 13.3
    let end_shot_2_time: Float = 22.0
    let end_shot_3_time: Float = 38.96
    let end_shot_4_time: Float = 54.2
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        slider.maximumValue = end_shot_4_time
        slider.value = 0
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "videoSegue"
        {
            let url : URL = Bundle.main.url(forResource: "Blockchain_Short_Video",
                                            withExtension: "mp4")!
            player1 = AVPlayer(url: url)
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
       slideTimer =  Timer.scheduledTimer(timeInterval: 0.1,
                             target: self,
                             selector: #selector(slideIt),
                             userInfo: nil,
                             repeats: true)
    }
    
    
    @objc
    
    func slideIt ()
    {
        sliderVal += 1
        
        if sliderVal <= end_shot_4_time
        {
            slider.value = sliderVal
        }
    }
    
    
    @objc func playerDidFinishPlaying ()
    {
        
    }
    
    
    
    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
}
