import UIKit

extension Shotlist_VC:
    UICollectionViewDelegate,
    UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        var prototypeId = ""
        if textEditingMode
        {
            prototypeId = "shotEditingCellId"
        }
        else
        {
            prototypeId = "shotCellId"
            
        }
        let cell : ShotCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: prototypeId,
                                                                               for: indexPath) as! ShotCollectionViewCell
        
        if let cur = AppData.curProject
        {
            let shot = cur.shots[indexPath.row]
            let shotLength = lengthCalculator(sentence: shot.script ?? "")
            
            cell.lengthLabel.text = "~ \(shotLength)\""
            cell.numberLabel.text = "Shot \(indexPath.row + 1)"
            cell.scriptTextView.text = shot.script
            cell.scriptTextView.delegate = self

            
            guard let shotImg = shot.artworkSet.img else
                       {
                           cell.imgView.backgroundColor = shot.bgColor
                           return cell
                       }
            
//
//            guard let shotImg = shot.img else
//            {
//                cell.imgView.backgroundColor = shot.bgColor
//                return cell
//            }
            
            if let cellImgView = cell.imgView
            {
                cellImgView.backgroundColor = UIColor.clear
                cellImgView.image = shotImg
            }
        }
        
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
        if textEditingMode
        {
            return
        }

        
        let graphics = Process.graphics
                     
        let storyboard = UIStoryboard(name: graphics.storyboardName,
                                      bundle: nil)
        let vc : Graphics_VC = storyboard.instantiateViewController(withIdentifier: graphics.viewControllerId) as! Graphics_VC
        
        
        vc.shotIndex = indexPath.row
        self.navigationController!.pushViewController(vc,
                                                      animated: true)
    }
}
