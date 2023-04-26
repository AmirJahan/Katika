import UIKit

extension Graphics_VC
{
    func loadSuggestions()
    {
        if shot.suggestions.count == 0
        {
            suggestionsBadge.isHidden = true
//            suggestionsButton.setTitleColor(UIColor.darkGray,
//                                            for: UIControl.State.normal)
//            suggestionsButton.isEnabled = false
            
            return
        }
        
        suggestionsBadge.isHidden = false
//        suggestionsButton.setTitleColor(UIColor.systemBlue,
//                                        for: UIControl.State.normal)
//        suggestionsButton.isEnabled = true
        
        suggestionsBadge.text = "\(shot.suggestions.count)"
    }
}
