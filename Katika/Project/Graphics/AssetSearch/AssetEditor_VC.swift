import UIKit
import  Colorful


protocol AssetEditorDelegate
{
    func changeAlpha ( value: Float)
}


class AssetEditor_VC: UIViewController
{
    @IBOutlet weak var alphaValue: UISlider!
 
    var alpha : Float = 0.0
    
    var delegate: AssetEditorDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        alphaValue.value = alpha
    }
    
    @IBAction func changeAlpha (_ slider: UISlider)
    {
        self.delegate.changeAlpha(value: slider.value)
    }
    
}
