import Foundation
import PocketSVG

extension Graphics_VC
{
    func addPinchGesture (artView: UIView)
    {
        artView.addGestureRecognizer(UIPinchGestureRecognizer(target: self,
                                                              action: #selector(scaleSelected)))
    }
    @objc func scaleSelected (_ gesture: UIPinchGestureRecognizer)
    {
        selectArtwork (gest: gesture)
        
        guard let scaleView = gesture.view else { return }
        
        switch gesture.state
        {
        case .changed:
            let pinchCenter = CGPoint(x: gesture.location(in: view).x - view.bounds.midX,
                                      y: gesture.location(in: view).y - view.bounds.midY)
            let transform = scaleView.transform.translatedBy(x: pinchCenter.x, y: pinchCenter.y)
                .scaledBy(x: gesture.scale,
                          y: gesture.scale)
                .translatedBy(x: -pinchCenter.x,
                              y: -pinchCenter.y)
            
            scaleView.transform = transform
            
            
            // THIS WAS ADDED
            selected?.transform.scale = Float( gesture.scale)
            
            
            // THIS WAS REMVOED
//            if let svg = selected?.svgAsset
//            {
//                svg.transform.scale = Float( gesture.scale)
//            }
//            else if let txt = selected?.txtAsset
//            {
//                let scaleRatio = Float (gesture.scale) / txt.transform.scale
//                let fontSize = Float( selected!.textView!.font!.pointSize ) * scaleRatio
//                
//                selected?.txtAsset?.textSize = fontSize
//            }
//            else if let img = selected?.imgAsset
//            {
//                img.transform.scale = Float( gesture.scale)
//            }
            
            gesture.scale = 1
            
        default:
            return
        }
    }
}
