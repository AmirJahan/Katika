import UIKit

extension Graphics_VC: RangeSeekSliderDelegate
{
    func didEndTouches(in slider: RangeSeekSlider)
    {
        var startTime : Float = 0.0
        
        if shotIndex == 0
        {
            startTime = Float(slider.selectedMinValue)
        }
        else
        {
            startTime = shot.startTime!
        }
        
        let endTime = Float (slider.selectedMaxValue)
        
        let duration = endTime - startTime
        
        
        shot.startTime = startTime
        shot.duration = duration
        
        
        shotSlider.maximumValue = duration
        shotSlider.value = 0
        shotEndLabel.text = "00\""
        
        playTime = 0
        player?.currentTime = Double (shot.startTime!)
        
        if shotIndex == (AppData.curProject?.shots.count)! - 1
        {
            return
        }
        
        let nextShot = AppData.curProject!.shots[shotIndex+1]
        nextShot.startTime = endTime
        
        
        
                // recreate frames
        MakeFrames.makeAllFrames(shot: shot, transitionLength: 0.0)
        
    }
}
