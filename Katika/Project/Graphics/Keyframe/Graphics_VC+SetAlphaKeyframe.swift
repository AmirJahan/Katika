import UIKit

extension Graphics_VC
{
    @IBAction func setAlphaKeyframe (_ sender: UIButton)
    {
        guard let sel = selected else { return }
        
        let timeFrame = Int (shotSlider.value * 25)
        
        var alpha : CGFloat = 1.0
        
        if let svg = sel.svgImgView
        {
            alpha = svg.alpha
        }
        else if let img = sel.imageView
        {
            alpha = img.alpha

        }
        if let txt = sel.textView
        {
            alpha = txt.alpha
        }
        
        let alphaVal: Float = Float (alpha)
        
        let keyframeAlpha = Keyframe (value: alphaVal,
                                     time: timeFrame)

        sel.alphaKeyframes.append(keyframeAlpha)
        
        // when a new keyframes is added, it is possible
        // that it is added in a wrong order
        sel.alphaKeyframes.sort { (a, b) -> Bool in
            a.time < b.time
        }
        
        MakeFrames.makeAlphaFrames(sel: sel, shot: shot, transitionLength: 0.0)
    }
}
