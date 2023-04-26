import UIKit
import AVFoundation

extension Graphics_VC
{
    func prepareForPlay ()
    {
        var voiceOver: Voiceover?
        for any in AppData.curProject!.voiceOvers
        {
            if (any.selected)
            {
                voiceOver = any
            }
        }
        
        do {
            let name = voiceOver!.name

            let title = AppData.curProject?.title
            let thisVoUrl = ReadWrite.buildVoUrl(title: title!,
                                                 name: name)
            
            player = try AVAudioPlayer(contentsOf: thisVoUrl)
            
            if let start = shot.startTime
            {
                player?.currentTime = Double (start)
            }
            
            player!.prepareToPlay()
        }
        catch let error as NSError
        {
            print(error.description)
        }
    }
}
