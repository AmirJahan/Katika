import UIKit

extension Shotlist_VC
{
    func prepareCollectionView ()
    {
        self.shotsCollectionView.delegate = self
        self.shotsCollectionView.dataSource = self
        
        self.view.layoutIfNeeded()
        self.shotsCollectionView.layoutIfNeeded()
        shotsCollectionView.contentInset = UIEdgeInsets(top: 0,
                                                        left: 0,
                                                        bottom: 0,
                                                        right: 0)
        
        let myLayout = UICollectionViewFlowLayout()
        
        let cellWidth = shotsCollectionView.bounds.width / 4
        let cellHeight = shotsCollectionView.contentSize.height - 16
        
        
        myLayout.itemSize = CGSize(width: cellWidth,
                                   height: cellHeight )
        myLayout.sectionInset = UIEdgeInsets.zero
        myLayout.minimumInteritemSpacing = 0.0
        myLayout.minimumLineSpacing = 0.0
        myLayout.scrollDirection = .horizontal
        
        shotsCollectionView.collectionViewLayout = myLayout
        

    }
}
