import UIKit
import AVFoundation

extension Export_VC {
    func prepareForplay() {
        if noVoiceover {
            return
        }
        do {
            let title = AppData.curProject?.title

            let url = ReadWrite.buildVoUrl(title: title!,
                                           name: selectedVo!.name)

            player = try AVAudioPlayer(contentsOf: url)
            guard let _ = player else { return }

            player!.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
    }
}
