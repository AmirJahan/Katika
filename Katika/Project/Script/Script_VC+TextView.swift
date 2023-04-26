import UIKit

extension Script_VC: UITextViewDelegate
{
    @objc
    func dismissAll ()
    {
        scriptTextView.resignFirstResponder()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if textView == scriptTextView
        {
            if (textView.text == textViewPlaceholder)
            {
                scriptTextView.textColor = UIColor.black
                scriptTextView.text = ""
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if textView == scriptTextView
        {
            if (textView.text == "" )
            {
                scriptTextView.textColor = UIColor.lightGray
                scriptTextView.text = textViewPlaceholder
            }
            
        }
    }
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool
    {

            AppData.curProject?.scriptChanged = true
        
//        countScriptWords ()
        
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool
    {
        return true
    }
}

