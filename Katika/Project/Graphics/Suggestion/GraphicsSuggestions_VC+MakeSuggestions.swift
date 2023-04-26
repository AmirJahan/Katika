import UIKit

extension GraphicsSuggestions_VC
{
    @IBAction func suggestShot (_ sender: UIButton)
    {
        self.suggestionDelegate.makeSuggestion()
        self.dismiss(animated: true,
                     completion: nil)
    }
}
