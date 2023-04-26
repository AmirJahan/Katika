import UIKit

enum TransitionStyle: CaseIterable
{
    case fade
    case coverRight
    case coverLeft
    case coverTop
    case coverBottom
    case scaleCenter
    case scaleTopLeft
}



extension Export_VC
{
    func transition (canvas: UIView)
    {
        let randomTransitionStyle = TransitionStyle.allCases.randomElement()!
        
        switch randomTransitionStyle
        {
        case .fade:
            canvas.alpha = 0.0
        case .coverRight:
            canvas.frame.origin.x = mainCanvas.frame.width
        
        case .coverTop:
            canvas.frame.origin.y = -mainCanvas.frame.height

        case .coverLeft:
            canvas.frame.origin.x = -mainCanvas.frame.width

        case .coverBottom:
            canvas.frame.origin.y = mainCanvas.frame.height

        case .scaleCenter:
            canvas.frame = CGRect.zero
            canvas.center = mainCanvas.center
            
            case .scaleTopLeft:
                canvas.frame = CGRect.zero

        }
        
        
        
        UIView.animate(withDuration: TimeInterval(transitionTime),
                       animations:
            {
            canvas.alpha = 1.0
                canvas.frame = self.mainCanvas.bounds
        }) { (res) in
            self.mainCanvas.subviews[0].removeFromSuperview()
        }
    }
    
    

}
    
