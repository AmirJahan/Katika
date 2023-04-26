import UIKit

extension AssetSearch_VC
{
    func keywordsSearch ()
    {
        let delay : Double = 0.5 //delay time in seconds
        let time = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline:time)
        {
//            print ("wrtworks fetched: \(AssetsData.assets.count)")
            
            for coreIdea in AppData.curProject!.keywords
            {
                for asset in AssetsData.assets
                {
                    keyworkdLoop: for keyword in asset.keywords
                    {
                        if (keyword.lowercased().contains(coreIdea.lowercased()))
                        {
                            self.subAssets.append(asset)
                            
                            break keyworkdLoop
                        }
                    }
                }
            }
            
            // maximum 20 subassets
            let maxItems = 20
            if self.subAssets.count >= maxItems
            {
                let temp = self.subAssets
                self.subAssets.removeAll()

                for i in 0..<maxItems
                {
                    self.subAssets.append( temp[i])
                }
            }
            
            
            // show the right text on the search text field
            var searchString = "searching "
            for i in 0..<AppData.curProject!.keywords.count
            {
                if i < AppData.curProject!.keywords.count - 2
                {
                    searchString += "\(AppData.curProject!.keywords[i]), "
                }
                else
                {
                    searchString += "\(AppData.curProject!.keywords[i])"
                }
            }
            self.assetSearchTextField.placeholder = searchString
            
                        
            self.assetsCollectionView.reloadData()
            self.assetSearchTextField.isEnabled = true

        }
        
    }
}
