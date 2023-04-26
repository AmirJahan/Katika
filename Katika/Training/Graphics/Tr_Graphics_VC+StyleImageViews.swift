import UIKit

extension Tr_Graphics_VC
{
    func styleImageViews (selected: Int?)
    {
        for i in 0..<imageViewArr.count
        {
            let view = imageViewArr[i]
            if ( i == selected )
            {
                view.layer.borderColor = UIColor.black.cgColor
                view.alpha = 1.0
                view.layer.borderWidth = 1.5
            }
            else
            {
                view.alpha = 0.75
                view.layer.borderWidth = 0.5
                view.layer.borderColor = UIColor.darkGray.cgColor
            }
        }
    }
}

