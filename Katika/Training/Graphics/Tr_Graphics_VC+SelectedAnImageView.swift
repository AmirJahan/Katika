import UIKit

extension Tr_Graphics_VC
{
    @IBAction func selectedAnImageView (_ slider: UISlider)
    {
        let index : Int = Int(round(slider.value))
        
        
        styleImageViews(selected: index)
    }
}
