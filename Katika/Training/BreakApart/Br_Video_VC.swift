import UIKit
import AVFoundation
import AVKit


class Br_Video_VC: UIViewController
{
    @IBAction func comeBackTo_Br_Video(_ unwindSegue: UIStoryboardSegue) {}
    
    @IBOutlet weak var nextbutton: UIButton!
    
    var player: AVPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        nextbutton.isHidden = true

        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "embeddedId"
        {
            let url : URL = Bundle.main.url(forResource: "Blockchain_Short_Video",
                                            withExtension: "mp4")!
            
            player = AVPlayer(url: url)
            NotificationCenter
                .default
                .addObserver(self,
                             selector: #selector(playerDidFinishPlaying),
                             name: .AVPlayerItemDidPlayToEndTime,
                             object: nil)
            
            let avCtrl = segue.destination as? AVPlayerViewController
            
            avCtrl!.player = player
            
            
        }
    }
    
    @objc
    func playerDidFinishPlaying ()
    {
        nextbutton.isHidden = false
    }

    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
        
    }
}
