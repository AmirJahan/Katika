import UIKit
import AVFoundation


extension Script_VC
{
    func play(voiceOver: Voiceover)
    {
        if ( player  != nil)
        {
            if player!.isPlaying
            {
                player?.stop()
            }
        }
        
        do {
            let name = voiceOver.name

            let title = AppData.curProject?.title
            let thisVoUrl = ReadWrite.buildVoUrl(title: title!,
                                                 name: name)
            
//            print ("this vo url: \(thisVoUrl)")
            
            player = try AVAudioPlayer(contentsOf: thisVoUrl)
            guard let _ = player else { return }
            
            player!.prepareToPlay()
            player!.play()
            
            
            AppData.curProject?.length = Float (player!.duration)
            
        }
        catch let error as NSError
        {
            print(error.description)
        }
    }
}
