import UIKit

extension Tr_Graphics_VC
{
    @IBAction func breakOrAssemble ()
    {
        if !breakMode
        { // go to break
            breakMode = true
//            breakOrAssembleButton.setTitle("Put Shot Back Together",
//                                           for: UIControl.State.normal)
            
            
            
            
            for any in sliders { any.isHidden = false }
            for each in notes { each.isHidden = false }
            
            if breakMode
            {
            continueButton.isHidden = false
            }
            self.continueButton.alpha = 0.0

            UIView.animate(withDuration: 1.0)
            {
                //                for view in self.imageViewArr
                //                {
                self.expandAllAt (sliderVal: 0.5)
                self.sliders[0].value = 0.5
                self.sliders[1].value = 0
                //                }
            }
            
            
            
            let seconds = 10.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                // Put your code which should be executed with a delay here
                
                UIView.animate(withDuration: 5.0)
                                          {
                                              
                                              self.continueButton.alpha = 1.0
                                          }
            }
  
        }
        else
        { // come out
            breakMode = false
//            breakOrAssembleButton.setTitle("Break This Shot Apart",
//                                           for: UIControl.State.normal)
           
            for any in sliders { any.isHidden = true }
            for each in notes { each.isHidden = true }
            
            continueButton.isHidden = true
            breakOrAssembleButton.isHidden = false
            
            UIView.animate(withDuration: 0.75,
                           animations:
                {
                    for view in self.imageViewArr
                    {
                        view.layer.transform = CATransform3DIdentity
                        
                        self.expandAllAt (sliderVal: 0.0)
                        self.sliders[0].value = 0.0
                        self.sliders[1].value = 0

                    }
            }, completion: { (res) in
                
                UIView.animate(withDuration: 0.25) {
                    self.clearBorders ()
                }
            })
        }
    }
    
    func clearBorders ()
    {
        for any in imageViewArr
        {
            any.layer.borderColor = UIColor.clear.cgColor
            any.alpha = 1.0
            any.layer.borderWidth = 0.0
        }
    }
}
