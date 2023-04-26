import UIKit

extension AssetSearch_VC
{
    func prepareAssetsCollectionView ()
    {
        self.assetsCollectionView.delegate = self
        self.assetsCollectionView.dataSource = self
        
        self.view.layoutIfNeeded()
        self.assetsCollectionView.layoutIfNeeded()
        let itemsPer = 5
        let cellWidth = self.assetsCollectionView.bounds.width / CGFloat ( itemsPer )
        
//        print ("collection vi is: \(self.assetsCollectionView.bounds.width)")
//        print ("cell is \(cellWidth)")
        
        let myLayout = UICollectionViewFlowLayout()
        myLayout.itemSize = CGSize(width: cellWidth,
                                   height: cellWidth)
        myLayout.sectionInset = UIEdgeInsets.zero
        myLayout.minimumInteritemSpacing = 0.0
        myLayout.minimumLineSpacing = 0.0
        self.assetsCollectionView.collectionViewLayout = myLayout
    }
}
