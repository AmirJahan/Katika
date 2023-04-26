import UIKit


extension Home_VC
{
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath)
    {
        let index = indexPath.row
        
        
        let project = AppData.projects[index]
        
        gotoScript (project)
    }
    
}
