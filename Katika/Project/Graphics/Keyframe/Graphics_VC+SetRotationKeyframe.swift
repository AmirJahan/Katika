import UIKit

extension Graphics_VC
{
    @IBAction func setRotationKeyframe (_ sender: UIButton)
    {
        guard let sel = selected else { return }
        
        let timeFrame = Int (shotSlider.value * 25)
        
        var rotation : CGFloat = 1.0
        
        if let svg = sel.svgImgView
        {
            let radians = atan2(svg.transform.b, svg.transform.a)
//                        let degrees = radians * 180 / .pi
            
            rotation = radians
        }
        else if let img = sel.imageView
        {
            let radians = atan2(img.transform.b, img.transform.a)
//                        let degrees = radians * 180 / .pi
            
            rotation = radians
            
        }
        else if let txt = sel.textView
        {
            let radians = atan2(txt.transform.b, txt.transform.a)
//                        let degrees = radians * 180 / .pi
            
            
//            print ("new rotation is: \(degrees)")
            
            rotation = radians
        }
        
        let rptationVal: Float = Float (rotation)
        
        let keyframeRotation = Keyframe (value: rptationVal,
                                         time: timeFrame)
        
        sel.rotationKeyframes.append(keyframeRotation)
        
        // when a new keyframes is added, it is possible
        // that it is added in a wrong order
        sel.rotationKeyframes.sort { (a, b) -> Bool in
            a.time < b.time
        }
        
        MakeFrames.makeRotationFrames(sel: sel, shot: shot, transitionLength: 0.0)
    }
}
