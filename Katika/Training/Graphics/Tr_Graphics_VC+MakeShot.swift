import UIKit

extension Tr_Graphics_VC
{
    func makeTheShot ()
    {
        for imgName in imgsArr!
        {
            let img = UIImage(named: imgName)
            let imgView = UIImageView(frame: canvas.bounds)
            imgView.image = img
            self.view.addSubview( imgView)
            
            imgView.center = canvas.center
            
            imageViewArr.append(imgView)
        }
        
        canvas.alpha = 0.15
    }
    
    func remakeShot ()
    {
        for any in imageViewArr
        {
            any.removeFromSuperview()
        }
        
        imageViewArr.removeAll()
        
        makeTheShot ()
    }
}
