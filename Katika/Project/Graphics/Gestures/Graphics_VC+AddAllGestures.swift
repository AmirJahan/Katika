import UIKit

extension Graphics_VC
{
    func addAllGestures (v: UIView)
    {
        addTapGesture (artView: v)
        addPanGesture (artView: v)
        addPinchGesture (artView: v)
        addRotateGesture (artView: v)
    }
}
