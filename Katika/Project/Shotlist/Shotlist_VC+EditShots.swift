import UIKit

extension Shotlist_VC
{
    @IBAction func editShots ()
    {
        if textEditingMode // come out
        {
            collectShots ()
            textEditingMode = false
            editShotsButton.setTitleColor(UIColor.darkGray,
                                          for: UIControl.State.normal)
            editShotsButton.setTitle("I think I would like to edit the shots.",
                                     for: UIControl.State.normal)
            continueButton.isEnabled = true
            continueButton.backgroundColor = UIColor.primary
            
            
            navigationItem.hidesBackButton = false
            
            saveShots()
        }
        else // go to edit mode
        {
            navigationItem.hidesBackButton = true
            
            textEditingMode = true
            editShotsButton.setTitleColor(UIColor.primary,
                                          for: UIControl.State.normal)
            editShotsButton.setTitle("I am done with shot scripts",
                                     for: UIControl.State.normal)
            continueButton.isEnabled = false
            continueButton.backgroundColor = UIColor.lightGray
        }
        
        shotsCollectionView.reloadData()
    }
    
}
