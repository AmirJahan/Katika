import UIKit

extension Graphics_VC
{
    func somethingSelected()
    {
        guard let sel = selected else { return }
        
        // edit
        
        if sel.svgAsset != nil
        {
            showOrEditAssetButton.setTitle("Edit",
                                           for: UIControl.State.normal)
            showOrEditAssetButton.setTitleColor(.systemRed,
                                                for: UIControl.State.normal)
        }
        else if sel.imageView != nil
        {
            showOrEditImageButton.setTitle("Edit",
                                           for: UIControl.State.normal)
            showOrEditImageButton.setTitleColor(.systemRed,
                                                for: UIControl.State.normal)
        }
        
        
    }
}
