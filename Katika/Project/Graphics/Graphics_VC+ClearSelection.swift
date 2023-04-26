import UIKit

extension Graphics_VC
{
    func clearSelection ()
    {
//        print ("cleaning, there are: \(mainCanvas.subviews.count)")
        for child in mainCanvas.subviews
        {
            child.layer.borderWidth = 0.0
            child.layer.borderColor = UIColor.clear.cgColor
            child.layer.cornerRadius = 0.0
            
//            print ("child count: \(child.layer.sublayers?.count)")

        }
        
        
        if let txt = selected?.textView
        {
            txt.resignFirstResponder()
            
//            textView.sizeToFit()
        }
        
        
        
        selected = nil
        
        hideDeleteButton ()
        
        // set the text to Add mode
        textDeselected ()
        
        setLockedMode ()
        
        nothingSelected ()
    }
}
