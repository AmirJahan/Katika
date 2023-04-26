import UIKit

extension Shotlist_VC
{
    func deleteShot (indexPath: IndexPath)
    {
        guard let project = AppData.curProject else { return }
        project.shots.remove(at: indexPath.row)
        
        self.shotsCollectionView.deleteItems(at: [indexPath])
    }
    
    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!)
    {
        if gesture.state != .ended {
            return
        }
        
        let p = gesture.location(in: self.shotsCollectionView)
        
        if let indexPath = self.shotsCollectionView.indexPathForItem(at: p)
        {
            
            print ("index is: \(indexPath.row)")
            
            // get the cell at indexPath (the one you long pressed)
//            let cell = self.shotsCollectionView.cellForItem(at: indexPath)
            
            
            let alert = UIAlertController (title: "Delete",
                                           message: "Are you sure you want to delete this shot?", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Yes",
                                          style: UIAlertAction.Style.default,
                                          handler: { (act) in
                                            
                                            self.deleteShot (indexPath: indexPath)
            }))
            
            alert.addAction(UIAlertAction(title: "No",
                                          style: UIAlertAction.Style.destructive,
                                          handler: nil))
            
            
            self.present(alert,
                         animated: true,
                         completion: nil)
            
            
            // do stuff with the cell
        } else
        {
            print("couldn't find index path")
        }
    }
}
