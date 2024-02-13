import UIKit

@IBDesignable
final class RoundCornerTextView: UITextView {

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

@IBDesignable
final class RoundCornerImageView: UIImageView {

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

@IBDesignable
final class RoundCornerLabel: UILabel {

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

@IBDesignable
final class RoundCornerButton: UIButton {

    //override func prepareForInterfaceBuilder()
    // {
    //        self.layer.borderWidth = 2.0
    //        self.layer.borderColor = UIColor.primary.cgColor
    //  self.layer.cornerRadius = 32.0
    //  self.clipsToBounds = true
    // }

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

@IBDesignable class BorderedImageView: UIImageView {

    override func prepareForInterfaceBuilder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
    }
}

@IBDesignable class BorderedButton: UIButton {

    override func prepareForInterfaceBuilder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
    }
}

@IBDesignable class BorderedLabel: UILabel {

    override func prepareForInterfaceBuilder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
    }
}

@IBDesignable class BorderedView: UIView {

    override func prepareForInterfaceBuilder() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor(named: "primary")?.cgColor
        self.layer.cornerRadius = 32.0
        self.clipsToBounds = true
    }
}

@IBDesignable class CanvasView: UIView {

    @IBInspectable
    var borderWidth: CGFloat {
        set {
            self.layer.borderWidth = 0.5
            self.layer.borderColor = UIColor.darkGray.cgColor
        }
        get {
            return layer.borderWidth
        }
    }
}

@IBDesignable class RoundCornerView: UIView {

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

extension UIButton {

    func roundCorners() {
        self.backgroundColor = UIColor(named: "primary")
        self.titleLabel?.font = AppSetting.buttonsFont

        self.layer.cornerRadius = CGFloat(32.0)
        //        self.clipsToBounds = true

        //        self.layer.shadowColor = UIColor(red: 0,
        //                                         green: 0,
        //                                         blue: 0,
        //                                         alpha: 0.25).cgColor
        //        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        //        self.layer.shadowOpacity = 1.0
        //        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
    }
}

@IBDesignable
final class RoundCornerTextField: UITextField {

    @IBInspectable
    var cornerRadius: CGFloat {
        set {
            self.font = AppSetting.textFieldsFont

            let paddingView: UIView = UIView(frame: CGRect(x: 0,
                                                           y: 0,
                                                           width: 10,
                                                           height: 10))
            self.leftView = paddingView
            self.leftViewMode = .always
            self.clearButtonMode = .whileEditing
            self.layer.masksToBounds = true
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
}

extension UITextField {

    func roundCorners() {
        self.backgroundColor = UIColor(named: "very light gray")
        self.font = AppSetting.textFieldsFont

        self.layer.cornerRadius = CGFloat(8.0)

        let paddingView: UIView = UIView(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: 20,
                                                       height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.clearButtonMode = .whileEditing

        //        self.clipsToBounds = true

        //        self.layer.shadowColor = UIColor(red: 0,
        //                                         green: 0,
        //                                         blue: 0,
        //                                         alpha: 0.25).cgColor
        //        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        //        self.layer.shadowOpacity = 1.0
        //        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = true
    }
}

extension UITextView {

    func roundCorners() {
        self.backgroundColor = UIColor(named: "very light gray")
        self.font = AppSetting.textFieldsFont

        self.layer.cornerRadius = CGFloat(8.0)
        //        self.clipsToBounds = true

        //        self.layer.shadowColor = UIColor(red: 0,
        //                                         green: 0,
        //                                         blue: 0,
        //                                         alpha: 0.25).cgColor
        //        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        //        self.layer.shadowOpacity = 1.0
        //        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = true
    }
}

@IBDesignable class ShadowedButton: UIButton {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

@IBDesignable class TitleLabel: UILabel {

    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.masksToBounds = true

            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }

    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable
    override var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }

    @IBInspectable
    override var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
