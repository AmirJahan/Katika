import Foundation

extension Shotlist_VC
{
    func reTimedShots (shots: Array<ShotFirstLastWords>,
                       voiceover: Voiceover) -> Array<ShotFirstLastWords>
    {
        var retimedShots: Array<ShotFirstLastWords> = []
        
        for i in 0..<shots.count
        {
            let oFirst = shots[i].firstWord
            let oLast = shots[i].lastWord
            
            var newShot: ShotFirstLastWords
            var newLast = oLast
            if ( oLast.timeStamp < oFirst.timeStamp)
            {
                newLast = TimedWord(timeStamp: voiceover.duration,
                                    word: oLast.word)
            }
            
            
            newShot = ShotFirstLastWords(firstWord: oFirst,
                                lastWord: newLast)
            
            
            retimedShots.append(newShot)
        }
        
        return retimedShots
    }
}
