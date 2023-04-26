import UIKit
import Speech

extension Shotlist_VC: SFSpeechRecognizerDelegate
{
    func findInsAndOuts ()
    {
        if AppData.curProject!.shotlListIsCurrent
        {
            return
        }
        
        // THIS IS JUST FOR NOW
        if AppData.curProject!.voiceOvers.count == 0
        {
            return
        }

      weBeganRcognizing()
        
        
        // find the VO
        var selectedVoiceover: Voiceover?
        for any in AppData.curProject!.voiceOvers
        {
            if (any.selected)
            {
                selectedVoiceover = any
            }
        }
        
        // Recognize the VO against the sentences
        recognize(voiceover: selectedVoiceover!) { (timedWords) in
            

            var tempShotsFirstLast: Array<ShotFirstLastWords> = []
            
            for shot in AppData.curProject!.shots
            {
                let thisShotAudio = self.searchForTimedWords(shotScript: shot.script!,
                                                timedWords: timedWords)
                tempShotsFirstLast.append(thisShotAudio)
            }
            

            let retimed = self.reTimedShots(shots: tempShotsFirstLast,
                                            voiceover: selectedVoiceover!)
            
            for i in 0..<retimed.count
            {
                let any = retimed[i]
                let timeIn  = any.firstWord.timeStamp
                let timeOut = any.lastWord.timeStamp
                
                AppData.curProject?.shots[i].startTime = timeIn
                AppData.curProject?.shots[i].duration = timeOut - timeIn
            }

            AppData.curProject!.shotlListIsCurrent = true

            
            self.weFinishedRcognizing()
        }
    }
}
