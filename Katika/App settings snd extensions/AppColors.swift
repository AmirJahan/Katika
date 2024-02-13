import UIKit

extension UIColor {

    public class var primary: UIColor {
        return UIColor(named: "primary")!
    }

    public class var selectedCell: UIColor {
        return UIColor(named: "selected cell")!
    }

    public class var secondary: UIColor {
        return UIColor(named: "secondary")!
    }

    public class var random: UIColor {
        return UIColor(
            red: .random(),
            green: .random(),
            blue: .random(),
            alpha: 1.0
        )
    }

//
//    public class var veryLightGray: UIColor
//    {
//        return UIColor (
//            red: 225.0/255.0,
//            green: 225.0/255.0,
//            blue: 225.0/255.0,
//            alpha: 1.0)
//    }
//
//    public class var ultraLightGray: UIColor
//    {
//        return UIColor (
//            red: 240.0/255.0,
//            green: 240.0/255.0,
//            blue: 240.0/255.0,
//            alpha: 1.0)
//    }
//

}
