import UIKit

extension Home_VC
{
    func prepareProjectsCollectionView ()
    {
        projectsCollectionView.delegate = self
        projectsCollectionView.dataSource = self
        self.view.layoutIfNeeded()
        self.projectsCollectionView.layoutIfNeeded()
        let itemsPer = 2
        let cellWidth = self.projectsCollectionView.bounds.width / CGFloat ( itemsPer )
        
        //        print ("collection vi is: \(self.assetsCollectionView.bounds.width)")
        //        print ("cell is \(cellWidth)")
        
        let myLayout = UICollectionViewFlowLayout()
        myLayout.itemSize = CGSize(width: cellWidth,
                                   height: cellWidth)
        myLayout.sectionInset = UIEdgeInsets.zero
        myLayout.minimumInteritemSpacing = 0.0
        myLayout.minimumLineSpacing = 0.0
        self.projectsCollectionView.collectionViewLayout = myLayout
    }
}

