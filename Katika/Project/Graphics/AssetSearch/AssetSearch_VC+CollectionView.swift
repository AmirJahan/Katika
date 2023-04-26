import UIKit
import PocketSVG

extension AssetSearch_VC:
    UICollectionViewDelegate,
    UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int
    {
        return subAssets.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "assetsCell", for: indexPath)
        
        let borderLayer = CALayer(layer: cell.layer)
        borderLayer.frame = cell.bounds.insetBy(dx: 5, dy: 5)
        borderLayer.borderWidth = 1.0
        borderLayer.borderColor = UIColor.lightGray.cgColor
        
        cell.layer.addSublayer(borderLayer)
        
        
        let cellAsset = subAssets[indexPath.row]
        
        
        
        
        if cell.subviews.count == 2
        {
            cell.subviews[1].removeFromSuperview()
        }
        
        addSvgToCell(asset: cellAsset,
                     container: cell)
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath)
    {
        let index = indexPath.row
        
        let selectedAsset = subAssets[index]
 
        self.delegate?.assetSelected(selectedAsset)
    }
}
