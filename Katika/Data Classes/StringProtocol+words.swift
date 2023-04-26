import Foundation


extension StringProtocol
{
    var words: [SubSequence]
    {
        return split { !$0.isLetter }
    }
}
