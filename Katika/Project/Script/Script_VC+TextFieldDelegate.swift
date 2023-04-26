import UIKit

extension Script_VC: UITextFieldDelegate
{    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool
    {
        if string == " "
        {
            return false
        }
        return true
    }
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        saveTitle ()
        textField.isEnabled = false
        
        
        // at this point, we add the dummy VOs
        addDummyVos ()
        
        return false
    }
    
}
