import Foundation
import PocketSVG

extension Graphics_VC
{
     func addTapOnCanvas ()
     {
        mainCanvas.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                           action: #selector(tappedOnCanvas)))
     }
    
    @objc func tappedOnCanvas (_ gesture: UITapGestureRecognizer)
    {
        // first clear everyeon
            clearSelection()
    }
    
}

