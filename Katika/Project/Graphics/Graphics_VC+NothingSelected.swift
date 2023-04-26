import UIKit

extension Graphics_VC
{
    func nothingSelected ()
    {
        
        showOrEditAssetButton.setTitle("Artwork",
                                       for: UIControl.State.normal)
        showOrEditAssetButton.setTitleColor(.systemBlue,
                                            for: UIControl.State.normal)
        
        showOrEditImageButton.setTitle("Image",
                                       for: UIControl.State.normal)
        showOrEditImageButton.setTitleColor(.systemBlue,
                                            for: UIControl.State.normal)
        
        
        if animationMode
        {
            setAnimationMode ()
        }
    }
}
