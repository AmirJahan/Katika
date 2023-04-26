import UIKit
import  Colorful


protocol ImageEditorDelegate
{
    func changeImageAlpha ( value: Float)
}


class ImageEditor_VC: UIViewController
{
    @IBOutlet weak var alphaValue: UISlider!
 
    var alpha : Float = 0.0
    
    var delegate: ImageEditorDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        alphaValue.value = alpha
    }
    
    @IBAction func changeAlpha (_ slider: UISlider)
    {
        self.delegate.changeImageAlpha(value: slider.value)
    }
    
}
