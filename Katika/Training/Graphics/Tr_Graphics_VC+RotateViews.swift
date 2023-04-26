import UIKit

extension Tr_Graphics_VC
{
    
    @objc
    func rotateViews ()
    {
        viewRotated = true
        let sensitivty: CGFloat = 0.002
        let vel = myPanGesture.velocity(in: self.view)
        
        rotateImageViews (x: vel.x * sensitivty,
                          y: vel.y * sensitivty)
    }
}
