import UIKit

extension Script_VC
{
    func makeKeywords ()
    {
        let sentence = scriptTextView.text ?? ""
        let words = sentence.words
        
        AppData.curProject?.keywords = []
        
        for keyword in words
        {
            if keyword.count != 1 && keyword.count != 2
            {
                AppData.curProject?.keywords.append(String(keyword))
            }
        }
        
    }
    
}
