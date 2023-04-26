
import UIKit
import AVFoundation

extension Script_VC
{
    func addDummyVos ()
    {
        let dummiesList = ["ml_audio_short", "blockchain_vo_tts"]
        
        for dummy in dummiesList
        {
            addThisDummyVo (name: dummy)
        }
        self.recordingsTableView.reloadData()
        
    }
    
    func addThisDummyVo (name: String )
    {
        let url = Bundle.main.url(forResource: name,
                                  withExtension: "mp3")!
        do
        {
            let pl = try AVAudioPlayer (contentsOf: url)
            let length = pl.duration
            
            let dummyVoLong = Voiceover(name: "\(name).mp3",
                                        fileName: url.absoluteString,
                                    duration: Float(length),
                                    selected: false)
            AppData.curProject?.voiceOvers.append(dummyVoLong)
            
        } catch let error as NSError
        {
            print(error.description)
        }
    }
}
