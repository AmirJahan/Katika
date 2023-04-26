import UIKit

extension Tr_Graphics_VC
{
    @IBAction func breakDown(_ sender: UISlider)
    {
        expandAllAt (sliderVal: sender.value)
    }
    
    func expandAllAt (sliderVal: Float)
    {
        for i in 0..<imageViewArr.count
        {
            expandImageView(view: imageViewArr[i],
                             sliderVal: CGFloat(sliderVal),
                             count: imageViewArr.count,
                             imgIndex: i)
        }
    }
    
    
    
}


