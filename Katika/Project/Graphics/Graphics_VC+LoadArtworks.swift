import UIKit

extension Graphics_VC
{
    func loadArtworks ()
    {
        mainCanvas.backgroundColor = shot.artworkSet.bgColor
        bgColorPicker.backgroundColor = shot.artworkSet.bgColor
        
        for artwork in shot.artworkSet.artworks
        {
            if let svg = artwork.svgImgView
            {
                svg.isUserInteractionEnabled = true

                addAllGestures(v: svg)
  
                mainCanvas.addSubview(svg)
            }
            
            else if let txt = artwork.textView
            {
                txt.isUserInteractionEnabled = true

                txt.sizeToFit()
                txt.delegate = self
//                fitTextView(txt)
                addAllGestures(v: txt)


                mainCanvas.addSubview(txt)
            }
            
            else if let img = artwork.imageView
            {
                img.isUserInteractionEnabled = true

                addAllGestures(v: img)

                mainCanvas.addSubview(img)
            }
            
            
            // lock unlock matters
            if artwork.locked
            {
                lock(artwork: artwork)
            }
            
        }
    }
}
