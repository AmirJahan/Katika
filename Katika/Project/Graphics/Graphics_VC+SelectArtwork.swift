import UIKit
import PocketSVG

extension Graphics_VC
{
    func selectArtwork (gest: UIGestureRecognizer)
    {
        clearSelection()
        
        guard let tappedView = gest.view else
        { return }
                
        // move current to top
        mainCanvas.bringSubviewToFront(tappedView)
        
        showDeleteButton ()
        
        tappedView.layer.borderWidth = 5.0
        tappedView.layer.cornerRadius = 5.0
        tappedView.layer.borderColor = UIColor(displayP3Red: 0.0,
                                               green: 0.0,
                                               blue: 1.0,
                                               alpha: 0.5).cgColor
        
        if let txt = tappedView as? UITextView
        {
            for i in 0..<shot.artworkSet.artworks.count
            {
                if shot.artworkSet.artworks[i].textView == txt
                {
                    selected = shot.artworkSet.artworks[i]
                    setLockedMode ()
                    shot.artworkSet.artworks.remove(at: i)
                    shot.artworkSet.artworks.append(selected!)
                    
                    // set the add text to edit mode
                    textSelected ()
                }
            }
        } else if let svg = tappedView as? SVGImageView
        {
            for i in 0..<shot.artworkSet.artworks.count
            {
                if shot.artworkSet.artworks[i].svgImgView == svg
                {
                    selected = shot.artworkSet.artworks[i]
                    setLockedMode ()
                    shot.artworkSet.artworks.remove(at: i)
                    shot.artworkSet.artworks.append(selected!)

                }
            }
        } else if let img = tappedView as? UIImageView {
            for i in 0..<shot.artworkSet.artworks.count
            {
                if shot.artworkSet.artworks[i].imageView == img
                {
                    selected = shot.artworkSet.artworks[i]
                    setLockedMode ()
                    shot.artworkSet.artworks.remove(at: i)
                    shot.artworkSet.artworks.append(selected!)
                }
            }
        }
        
        somethingSelected ()
    }
    
}
