import UIKit

extension Graphics_VC
{
    @IBAction func deleteArtwork (_ sender: UIButton)
    {
        
        if let txt = selected?.textView {
            txt.removeFromSuperview()
            for i in 0..<shot.artworkSet.artworks.count
            {
                if shot.artworkSet.artworks[i].textView == txt
                {
                    shot.artworkSet.artworks.remove(at: i)
                }
            }
        } else if let svg = selected?.svgImgView {
            svg.removeFromSuperview()
            
            for i in 0..<shot.artworkSet.artworks.count
            {
                if shot.artworkSet.artworks[i].svgImgView == svg
                {
                    shot.artworkSet.artworks.remove(at: i)
                }
            }
        } else if let img = selected?.imageView {
            img.removeFromSuperview()
            
            for i in 0..<shot.artworkSet.artworks.count
            {
                if shot.artworkSet.artworks[i].imageView == img
                {
                    // shot.artworks.append(selected!)
                    shot.artworkSet.artworks.remove(at: i)

                }
            }
        }
        
        clearSelection ()
        hideDeleteButton ()
        
        
        // if we were in edit text mode, we should pop back
        textDeselected ()
    }
    
    
    func hideDeleteButton ()
    {
        deleteArtworkButton.isHidden = true
    }
    
    
    func showDeleteButton ()
    {
        deleteArtworkButton.isHidden = false
    }
    
}
