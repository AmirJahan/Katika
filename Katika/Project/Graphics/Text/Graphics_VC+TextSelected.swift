import UIKit


extension Graphics_VC
{
    func textSelected()
    {
        addTextMode = false
        makeOrEditTextButton.setTitle("Edit",
                                      for: UIControl.State.normal)
        makeOrEditTextButton.setTitleColor(UIColor.systemRed,
                                           for: UIControl.State.normal)
        
    }
    
    
    func textDeselected ()
    {
        addTextMode = true

        makeOrEditTextButton.setTitle("Text",
                                      for: UIControl.State.normal)
        makeOrEditTextButton.setTitleColor(UIColor.systemBlue,
                                           for: UIControl.State.normal)
        
    }
    
}

