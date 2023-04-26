import Foundation
import PocketSVG

extension Graphics_VC
{
    func addTapGesture (artView: UIView)
    {
        artView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                            action: #selector(tapSelected)))
    }
    
    @objc func tapSelected (_ gesture: UITapGestureRecognizer)
    {
        selectArtwork(gest: gesture)
    }
}
