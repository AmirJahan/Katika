import UIKit
import AVFoundation
import AVKit

class Br_SingleShot_VC: UIViewController
{
    @IBAction func comeBackTo_Br_Shots(_ unwindSegue: UIStoryboardSegue) {}

    
    var shotName : String = ""
    var player: AVPlayer?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        switch segue.identifier
        {
        case "shot_1_video_segue":
            let url : URL = Bundle.main.url(forResource: shotName,
                                            withExtension: "mp4")!
            player = AVPlayer(url: url)
            let avCtrl = segue.destination as? AVPlayerViewController
            avCtrl!.player = player
            
        default:
            player!.pause()
        }
    }


    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
}
