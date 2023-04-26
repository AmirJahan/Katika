import UIKit

extension Script_VC
{
    func saveTitle ()
    {
        // TODO: Add check for empty, etc
        
        let projectName: String = titleTextField.text!
        if projectName == ""
        {
            return
        }
        
        
        ifNoProject ()
        
        
        if let curProj = AppData.curProject
        {
            // renameing project
            curProj.title = projectName
        }

        ReadWrite.write() 
    }
}
