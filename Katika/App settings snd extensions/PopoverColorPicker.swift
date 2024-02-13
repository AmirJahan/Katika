import UIKit
import Colorful

class PopoverColorPicker: UIViewController {

    @IBOutlet weak var colorPicker: ColorPicker!
    var startColor = UIColor.white
    var colorDelegate: ColorPickerDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.addTarget(self,
                              action: #selector(self.handleColorChanged(picker:)),
                              for: .valueChanged)

        colorPicker.set(color: startColor,
                        colorSpace: .sRGB)
        handleColorChanged(picker: colorPicker)
    }

    @objc func handleColorChanged(picker: ColorPicker) {
        self.colorDelegate.newColorIs(color: picker.color)
    }
}
