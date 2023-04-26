import UIKit
import  Colorful

class TextEditor_VC: UIViewController
{
    @IBOutlet weak var colorPicker: ColorPicker!
    @IBOutlet weak var sizeSlider: UISlider!
    var startColor = UIColor.white
    var textSize : Float = 0.0
    var delegate: EditTextDelegate!

    @IBOutlet weak var alphaSlider: UISlider!
    var textAlpha : Float = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.addTarget(self,
                              action: #selector(self.handleColorChanged(picker:)),
                              for: .valueChanged)

        colorPicker.set(color: startColor,
                        colorSpace: .sRGB)
        handleColorChanged(picker: colorPicker)
        
        sizeSlider.value = textSize
        
        alphaSlider.value = textAlpha
    }

    @objc func handleColorChanged(picker: ColorPicker)
    {
        self.delegate.changeColor(color: picker.color)
    }
    
    
    @IBAction func resizeText (_ slider: UISlider)
    {
        let newFont: UIFont = UIFont.systemFont(ofSize: CGFloat(slider.value))
        self.delegate.changeSize(font: newFont)
    }
    
    @IBAction func changeAlpha (_ slider: UISlider)
    {
        self.delegate.changeAlpha(alpha: slider.value)

    }
    
}
