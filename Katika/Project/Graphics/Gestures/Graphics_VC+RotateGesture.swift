import Foundation
import PocketSVG

extension Graphics_VC
{
     func addRotateGesture (artView: UIView)
     {
         artView.addGestureRecognizer(UIRotationGestureRecognizer(target: self,
                                                              action: #selector(rotateSelected)))
     }
    @objc func rotateSelected (_ gesture: UIRotationGestureRecognizer)
    {
        selectArtwork (gest: gesture)
        
        guard let rotateView = gesture.view else { return }
        
        if gesture.state == .began || gesture.state == .changed
        {
            rotateView.transform = rotateView.transform.rotated(by: gesture.rotation)
            gesture.rotation = 0
        }
    }
    
}
