import UIKit

extension Graphics_VC
{
    @IBAction func setPositionKeyframe (_ sender: UIButton)
    {
        guard let sel = selected else { return }
        
        let timeFrame = Int (shotSlider.value * 25)
        
        var cen = CGPoint.zero
        
        if let svg = sel.svgImgView
        {
            cen = svg.center
        }
        else if let img = sel.imageView
        {
            cen = img.center
            
        }
        else if let txt = sel.textView
        {
            cen = txt.center
        }
        
        let xVal: Float = Float (cen.x)
        let yVal: Float = Float (cen.y)
        
        let keyframePosX = Keyframe (value: xVal,
                                  time: timeFrame)
        let keyframePosY = Keyframe (value: yVal,
                                  time: timeFrame)
        
        sel.xPositionKeyframes.append(keyframePosX)
        sel.yPositionKeyframes.append(keyframePosY)

        // when a new keyframes is added, it is possible
        // that it is added in a wrong order
        sel.xPositionKeyframes.sort { (a, b) -> Bool in
            a.time < b.time
        }
        
        sel.yPositionKeyframes.sort { (a, b) -> Bool in
            a.time < b.time
        }
        
        MakeFrames.makePositionFrames(sel: sel, shot: shot, transitionLength: 0.0)
    }
}
