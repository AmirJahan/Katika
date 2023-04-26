import UIKit

extension Graphics_VC: UITextViewDelegate
{
    
    func selectEditingTextView (textView: UITextView)
    {
        for art in shot.artworkSet.artworks
        {
            if let txt = art.textView
            {
                if txt == textView
                {
                    clearSelection()
                           
                    
                    // move current to top
                    mainCanvas.bringSubviewToFront(textView)
                    
                    showDeleteButton ()
                    
                    textView.layer.borderWidth = 5.0
                    textView.layer.cornerRadius = 5.0
                    textView.layer.borderColor = UIColor(displayP3Red: 0.0,
                                                           green: 0.0,
                                                           blue: 1.0,
                                                           alpha: 0.5).cgColor
                    

                                selected = art
                    setLockedMode ()
                    if let index = shot.artworkSet.artworks.firstIndex(of: art) {
                        shot.artworkSet.artworks.remove(at: index)
                    }
                    
                    shot.artworkSet.artworks.append(selected!)
                                
                                // set the add text to edit mode
                                textSelected ()
    
                    
                    somethingSelected ()
                    
                    return
                }
            }
        }
        
//        print("sel")
    }
    
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        selectEditingTextView (textView: textView)
        

    }
    
    func textView(_ textView: UITextView,
                  shouldChangeTextIn range: NSRange,
                  replacementText text: String) -> Bool
    {
        if text == "" && range.length > 0 { //Backspace
            textView.frame = CGRect(x: textView.frame.origin.x,
                                    y: textView.frame.origin.y,
                                    width: textView.frame.width - 10,
                                    height: textView.frame.height)

        }
        
        else if text == "\n" {
            textView.resignFirstResponder()
            
            textView.sizeToFit()

            return false
        }
        else
        {
            textView.frame = CGRect(x: textView.frame.origin.x,
                                    y: textView.frame.origin.y,
                                    width: textView.frame.width + 10,
                                    height: textView.frame.height)
        }
        
        let newFrame = textView.frame
        
        // this was removed
//        selected?.txtAsset?.frameString = NSCoder.string(for: newFrame)
        
        // this was added
        selected?.frameString = NSCoder.string(for: newFrame)
        
        return true
    }
}

