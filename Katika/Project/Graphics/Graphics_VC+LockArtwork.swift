import UIKit

extension Graphics_VC
{
    func setLockedMode ()
    {
        lockButton.isHidden = false
        if let sel = selected
        {
            if sel.locked
            {
                lockButton.setImage(UIImage(systemName: "lock.fill"), for: .normal)
            }
            else
            {
                lockButton.setImage(UIImage(systemName: "lock.open.fill"), for: .normal)
                
            }
        }
        else
        {
            // nothing selected
            for any in shot.artworkSet.artworks
            {
                if any.locked
                {
                    // someone is selected
                    lockButton.setImage(UIImage(systemName: "lock"), for: .normal)
                    return
                }
            }
            
            lockButton.isHidden = true
            
        }
    }
    
    func unlockAll ()
    {
        for any in shot.artworkSet.artworks
        {
            
            unlock(artwork: any)
        }
        setLockedMode ()
    }
    
    @IBAction func lockUnlock (_ sender: UIButton)
    {
        if let sel = selected
        {
            if sel.locked
            {
                // unlock - Add egstures
                unlock (artwork: sel)
            }
            else
            {
                // lock
                lock (artwork: sel)
            }

            setLockedMode ()
        }
        else
        {
            unlockAll ()
        }
        
        
    }
    
    func lock (artwork: Artwork)
        {
            artwork.locked = true
            if let svg = artwork.svgImgView
            {
                svg.isUserInteractionEnabled = false
    //            addAllGestures(v: svg)
            }
                
            else if let txt = artwork.textView
            {
                txt.isUserInteractionEnabled = false
    //            addAllGestures(v: txt)
            }
                
            else if let img = artwork.imageView
            {
                img.isUserInteractionEnabled = false
                addAllGestures(v: img)
            }
        }
    
    
    func unlock (artwork: Artwork)
    {
        artwork.locked = false

        if let svg = artwork.svgImgView
        {
            svg.isUserInteractionEnabled = true
//            addAllGestures(v: svg)
        }
            
        else if let txt = artwork.textView
        {
            txt.isUserInteractionEnabled = true
//            addAllGestures(v: txt)
        }
            
        else if let img = artwork.imageView
        {
            img.isUserInteractionEnabled = true
            addAllGestures(v: img)
        }
    }
}
