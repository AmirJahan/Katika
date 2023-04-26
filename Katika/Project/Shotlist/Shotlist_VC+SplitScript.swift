import UIKit

extension Shotlist_VC
{
    func splitScript (script: String) -> [String]
    {
        var collapsedString = script.replacingOccurrences(of: "\n",
                                                          with: " ")
        collapsedString = collapsedString.replacingOccurrences(of: "  ",
                                                               with: " ")
        
        let arrayOfWords = collapsedString.components(separatedBy: " ")
        var arrayOfSentences : [String] = []
        
        var nextSentenceString : String = ""
        var nextSentenceCount = 0
        var lastWasDot = false
        for word in arrayOfWords
        {
            if word != "" && !word.isEmpty
            {
                if !lastWasDot
                {
                    if word.contains(".")
                    {
                        lastWasDot = true
                    }
                }
                    
                else
                {
                    lastWasDot = false
                    if (nextSentenceCount > minLengthOfSentence)
                    {
                        nextSentenceString = nextSentenceString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                        arrayOfSentences.append(nextSentenceString)
                        nextSentenceString = ""
                        nextSentenceCount = 0
                    }
                }
                nextSentenceCount += 1
                nextSentenceString += "\(word) "
            }
        }
        
        if nextSentenceCount != 0
        {
            arrayOfSentences.append(nextSentenceString)
        }
        
        return arrayOfSentences
    }
}
