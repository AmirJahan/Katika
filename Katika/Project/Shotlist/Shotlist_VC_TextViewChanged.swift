import UIKit

extension Shotlist_VC: UITextViewDelegate
{
    func textViewDidChange(_ textView: UITextView)
    {
        guard let cell = textView.superview?.superview as? ShotCollectionViewCell else {
            return // or fatalError() or whatever
        }
        
        if let indexPath = shotsCollectionView.indexPath(for: cell)
        {
            //            print ("reached 1 \()")
            AppData.curProject?.shots[indexPath.row].script = textView.text
            
        }
    }
}
