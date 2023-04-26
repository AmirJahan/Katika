import UIKit
import Speech

extension Shotlist_VC
{
    func searchForTimedWords (shotScript: String,
                 timedWords: Array<TimedWord>) -> ShotFirstLastWords
    {
        let wordsInTheShot = shotScript.words
        
        var arrayOfConfidences : Array<MatchedSentence> = []
        
        iLoop: for i in 0..<wordsInTheShot.count
        {
            jLoop: for j in 0..<timedWords.count
            {
                if (wordsInTheShot[i] == timedWords[j].word)
                {
                    //                    print ("We are at: \(shotWords[i])")
                    var newMatch = MatchedSentence()
                    newMatch.words.append(timedWords[j])
                    //                    var jInc = 0
                    iiLoop: for ii in i..<wordsInTheShot.count
                    {
                        // search -3 and +3
                        for m in -8...8
                        {
                            let targetJ = j + m
                            if ( targetJ < timedWords.count &&
                                targetJ >= 0 && m != 0)
                            {
                                if (wordsInTheShot[ii] == timedWords[targetJ].word)    {
                                    newMatch.confidence += 1
                                    
                                    newMatch.words.append(timedWords[targetJ])
                                }
                            }
                        }
                        
                        arrayOfConfidences.append(newMatch)
                        if (newMatch.confidence == wordsInTheShot.count) // found 100%
                        {
                            break iLoop
                        }
                    }
                }
            }
        }
        
        if ( arrayOfConfidences.count == 0)
        {
//            print ("Didn't find any similar text")
            
            let first = TimedWord(timeStamp: 0,
                                  word: "Empty")
            let last = TimedWord(timeStamp: 5,  // statically going to 5th scond
                word: "Empty")
            
            let emptyShotAudio = ShotFirstLastWords(firstWord: first,
                                           lastWord: last)
            
            return emptyShotAudio
        }
        
        var bestConfidence = arrayOfConfidences[0]
        
        for confidence in arrayOfConfidences
        {
            if (confidence.confidence > bestConfidence.confidence)
            {
                bestConfidence = confidence
            }
        }
        
        let first = bestConfidence.words.first!
        let last = bestConfidence.words.last!
                
        let newShotAudio = ShotFirstLastWords(firstWord: first,
                                     lastWord: last)

        return newShotAudio
    }
}
