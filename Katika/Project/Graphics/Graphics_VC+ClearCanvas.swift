import UIKit

extension Graphics_VC
{
    func clearCanvas ()
    {
        for artwork in mainCanvas.subviews
        {
            artwork.removeFromSuperview()
        }
    }
}

