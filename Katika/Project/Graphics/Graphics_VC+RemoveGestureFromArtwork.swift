import UIKit

extension Graphics_VC
{
    func removeGesturesFromArtwork (artwork: Artwork)
    {
        if let svg = artwork.svgImgView
        {
            for recognizer in svg.gestureRecognizers ?? []
            {
                svg.removeGestureRecognizer(recognizer)
            }
        }
        
        if let txt = artwork.textView
        {
            for recognizer in txt.gestureRecognizers ?? []
            {
                txt.removeGestureRecognizer(recognizer)
            }
        }
        
        if let img = artwork.imageView
        {
            for recognizer in img.gestureRecognizers ?? []
            {
                img.removeGestureRecognizer(recognizer)
            }
        }
    }
}
