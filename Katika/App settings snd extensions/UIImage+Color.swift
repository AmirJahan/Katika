import UIKit

extension UIImage {

    class func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 192, height: 108)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 192,
                                                      height: 108), false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
