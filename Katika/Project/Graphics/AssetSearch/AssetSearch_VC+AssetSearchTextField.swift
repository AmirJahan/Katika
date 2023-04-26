import UIKit

extension AssetSearch_VC: UITextFieldDelegate
{
    
    @objc
    func textFieldDidChange ()
    {
        
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if ( assetSearchTextField.text!.count < 3) { return false }
        
        let searchTxt = assetSearchTextField.text!
        let searchTerms = searchTxt.split(separator: " ")
        
        subAssets.removeAll()
        var allSearchResults : [SvgFile] = []
        
        for each in AssetsData.assets
        {
            assetLoop: for key in each.keywords
            {
                for searchterm in searchTerms
                {
                    if key.lowercased().contains(searchterm.lowercased())
                    {
                        allSearchResults.append(each)
                        break assetLoop
                    }
                }
            }
        }
        
        if allSearchResults.count > 20
        {
            for i in 0..<20
            {
                subAssets.append(allSearchResults[i])
            }
        }
        else
        {
            subAssets = allSearchResults
        }
                
        assetsCollectionView.reloadData()
        
        assetSearchTextField.text = ""
        self.assetSearchTextField.placeholder = "separate search by spaces"
        
        return true
    }
}
