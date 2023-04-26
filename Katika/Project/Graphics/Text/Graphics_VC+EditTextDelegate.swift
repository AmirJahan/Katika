import UIKit

extension Graphics_VC: EditTextDelegate
{
    func changeColor(color: UIColor)
    {
        if let txt = selected?.textView
        {
            txt.textColor = color
            txt.sizeToFit()
        }
    }
    
    func changeSize(font: UIFont)
    {
        if let txt = selected?.textView
        {
            txt.frame = CGRect(x: txt.frame.origin.x,
                                    y: txt.frame.origin.y,
                                    width: txt.frame.width * 2,
                                    height: txt.frame.height * 2)
            
            txt.font = font
            let fontSize = Float( txt.font!.pointSize)
            selected!.txtAsset?.textSize =  fontSize
            txt.sizeToFit()
        }
    }
    
    func changeAlpha (alpha: Float)
    {
        if let txt = selected?.textView
         {
            txt.alpha = CGFloat(alpha)
         }
    }
}


