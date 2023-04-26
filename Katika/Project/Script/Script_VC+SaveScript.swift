import UIKit

extension Script_VC
{

    
    func saveScript ()
    {
        ifNoProject ()
        
        AppData.curProject?.script = scriptTextView.text
        
        // making the keywords
        makeKeywords ()
        
        ReadWrite.write()
    }
    
    
    
}
