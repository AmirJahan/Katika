import UIKit

extension Graphics_VC
{
    @IBAction func setScaleKeyframe (_ sender: UIButton)
    {
        guard let sel = selected else { return }
        
        let timeFrame = Int (shotSlider.value * 25)
        
        var scale = CGPoint (x: 1, y: 1)
        
        if let svg = sel.svgImgView
        {
            scale.x = svg.transform.a
            scale.y = svg.transform.d
        }
        else if let img = sel.imageView
        {
            scale.x = img.transform.a
            scale.y = img.transform.d
        }
        else if let txt = sel.textView
        {
            scale.x = txt.transform.a
            scale.y = txt.transform.d
        }
        
        let xVal: Float = Float (scale.x)
        let yVal: Float = Float (scale.y)
        
        let keyframeSclX = Keyframe (value: xVal,
                                     time: timeFrame)
        let keyframeSclY = Keyframe (value: yVal,
                                     time: timeFrame)
        
        
        sel.xScaleKeyframes.append(keyframeSclX)
        sel.yScaleKeyframes.append(keyframeSclY)
        
        // when a new keyframes is added, it is possible
        // that it is added in a wrong order
        sel.xScaleKeyframes.sort { (a, b) -> Bool in
            a.time < b.time
        }
        
        sel.yScaleKeyframes.sort { (a, b) -> Bool in
            a.time < b.time
        }
        
        
//        dump ("scale is: \(sel.xScaleKeyframes)")
//        dump (sel.yScaleKeyframes)
        
        
        MakeFrames.makeScaleFrames (sel: sel, shot: shot, transitionLength: 0.0)
    }
}
