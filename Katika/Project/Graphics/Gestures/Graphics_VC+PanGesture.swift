import Foundation
import PocketSVG

extension Graphics_VC
{
    func addPanGesture (artView: UIView)
    {
        artView.addGestureRecognizer(UIPanGestureRecognizer(target: self,
                                                            action: #selector(moveSelected)))
    }
    
    @objc
    func moveSelected (_ gesture: UIPanGestureRecognizer)
    {
        selectArtwork(gest: gesture)
        //        selectArtwork (gest: gesture)
        //
        //        guard let moveView = gesture.view else { return }
        //
        //
        //        moveView.center = gesture.location(in: mainCanvas)
        guard gesture.view != nil else {return}
        let piece = gesture.view!
        // Get the changes in the X and Y directions relative to
        // the superview's coordinate space.
        let translation = gesture.translation(in: piece.superview)
        if gesture.state == .began {
            // Save the view's original position.
            initialCenter = piece.center
        }
            // Update the position for the .began, .changed, and .ended states
        else if gesture.state != .cancelled {
            // Add the X and Y translation to the view's original position.
            let newCenter = CGPoint(x: initialCenter.x + translation.x,
                                    y: initialCenter.y + translation.y)
            piece.center = newCenter
            
        }
        else {
            // On cancellation, return the piece to its original location.
            piece.center = initialCenter
        }
    }
}

extension CGPoint
{
    static func + (first: CGPoint, next: CGPoint) -> CGPoint
    {
        return CGPoint (x: first.x + next.x,
                        y: first.y + next.y)
    }
    
    static func - (first: CGPoint, next: CGPoint) -> CGPoint
    {
        return CGPoint (x: first.x - next.x,
                        y: first.y - next.y)
    }
}
