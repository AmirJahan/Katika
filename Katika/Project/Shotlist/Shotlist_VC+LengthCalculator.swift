import UIKit

extension Shotlist_VC
{
    func lengthCalculator (sentence: String) -> Int
    {
        let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
        let components = sentence.components(separatedBy: chararacterSet)
        let words = components.filter { !$0.isEmpty }
        let numberOfWords = words.count
        
        let seconds = numberOfWords * 60 / 150
        return seconds
    }
}
