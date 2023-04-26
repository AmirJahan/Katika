import UIKit

extension Tr_Graphics_VC
{
    
    func expandImageView (view: UIImageView,
                           sliderVal: CGFloat,
                           count: Int,
                           imgIndex: Int)
    {
        let totalPixelsX : CGFloat = 800
        let leftMostPixel : CGFloat = -totalPixelsX / 2.0
        let movePixels : CGFloat = totalPixelsX / CGFloat(count)
        let moveThisByPixels: CGFloat = movePixels * CGFloat(imgIndex)
        let xVal : CGFloat = (leftMostPixel + moveThisByPixels) * sliderVal
        
        
        view.center = CGPoint(x: center.x + xVal,
                              y: center.y)
        
        if ( viewRotated )
        {
            return
        }
        styleImageViews(selected: nil)
        let transformY = CATransform3DMakeRotation(self.deg2rad(-45) * sliderVal,
                                                   0,
                                                   1,
                                                   0)
        
        let transformZ = CATransform3DMakeRotation(self.deg2rad(20) * sliderVal,
                                                   0,
                                                   0,
                                                   1)
        
        view.layer.transform = CATransform3DConcat(transformZ,
                                                   transformY)
    }
}


