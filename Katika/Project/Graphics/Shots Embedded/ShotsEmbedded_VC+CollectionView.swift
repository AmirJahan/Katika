import UIKit

extension ShotsEmbedded_VC:
    UICollectionViewDelegate,
    UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : ShotEmbeddedCollectionViewCell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "shotCellId",
                                 for: indexPath) as! ShotEmbeddedCollectionViewCell
        
        guard let cur = AppData.curProject else {return cell}
        
            let shot = cur.shots[indexPath.row]
            
        
        if let shotImg = shot.artworkSet.img
                      {
                          cell.img.image = shotImg
                      }
        
//        if let shotImg = shot.img
//                  {
//                      cell.img.image = shotImg
//                  }
        
        
        if indexPath.row == currentShot
        {
            cell.roundLbl.backgroundColor = .red
        }
        else
        {
            cell.roundLbl.backgroundColor = .primary
        }
        
            
            cell.roundLbl.text = "S\(shot.number! + 1)"
            cell.lbl.text = "Shot \(shot.number! + 1)"

//        cell.backgroundColor = .red
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int
    {
        return AppData.curProject!.shots.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath)
    {
//        print ("selected: \(indexPath.row)")
        self.delegate.changeShot(index: indexPath.row)
    }
}
