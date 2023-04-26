import UIKit

extension AssetSearch_VC
{
    func prepareAssetSearchtextField ()
    {
        assetSearchTextField.roundCorners()
        let paddingView: UIView = UIView(frame: CGRect(x: 0,
                                                       y: 0,
                                                       width: 20,
                                                       height: 20))
        assetSearchTextField.leftView = paddingView
        assetSearchTextField.leftViewMode = .always
        assetSearchTextField.clearButtonMode = .whileEditing
        assetSearchTextField.delegate = self
    }
}
