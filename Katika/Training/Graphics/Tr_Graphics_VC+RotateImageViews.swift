import UIKit

extension Tr_Graphics_VC
{
    func rotateImageViews (x: CGFloat, y: CGFloat)
    {
        for view in imageViewArr
        {
            let rotY = CATransform3DRotate(view.layer.transform,
                                           self.deg2rad(-x),
                                           0,
                                           1,
                                           0)
            
            let rotZ = CATransform3DRotate(view.layer.transform,
                                           self.deg2rad(-y),
                                           0,
                                           0,
                                           1)
            
            if ( abs(x) > abs (y))
            {
                view.layer.transform = rotY
            }
            else
            {
                view.layer.transform = rotZ
            }
        }
        
    }
}
