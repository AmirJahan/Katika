import UIKit

extension Graphics_VC
{
    func captureCanvas(of mView: UIView) -> UIImage?
    {
        UIGraphicsBeginImageContextWithOptions (mView.bounds.size,
                                                false,
                                                0.0)
        
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext()
        {
            mView.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }
}
