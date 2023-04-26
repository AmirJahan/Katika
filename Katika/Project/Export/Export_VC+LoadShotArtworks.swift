import UIKit
import  AVFoundation

extension Export_VC
{
    func loadArtworks (shot: Shot, into canvas: UIView)
    {
        for artwork in shot.artworkSet.artworks
        {
            if let svg = artwork.svgImgView
            {
                canvas.addSubview(svg)
            }
                
            else if let txt = artwork.textView
            {
                txt.sizeToFit()
                canvas.addSubview(txt)
            }
                
            else if let img = artwork.imageView
            {
                canvas.addSubview(img)
            }
        }
        

    }
}

