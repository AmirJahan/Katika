import UIKit

extension MakeFrames
{
    class func makeTheFramesFor (obj sel: Artwork,
                           of keyFrames: [Keyframe],
                           shot: Shot,
                           transitionLength: Float) -> [Float]
    {
        let shotFrames = Int ( (shot.duration! + transitionLength) * 25 )
        
        
        var keyframes = keyFrames
        if keyframes.count < 2 { return [] }
        keyframes.sort { (a, b) -> Bool in
            a.time < b.time
        }
        
        
        var frames : [Float] = Array(repeating: 0.0, count: shotFrames + 1)
                
        let firstKeyFrame = keyframes.first
        let lastKeyframe = keyframes.last
        
        for frame in 0..<firstKeyFrame!.time
        {
            frames[frame] = firstKeyFrame!.value
        }
        
        for frame in lastKeyframe!.time...shotFrames
        {
            frames[frame] = lastKeyframe!.value
        }
        
        
        let last = keyframes.count - 1
        for ind in 0..<last
        {
            let curKeyframe = keyframes[ind]
            let value = curKeyframe.value
            let time = curKeyframe.time
            
            var /*nextKeyframe = keyframes[0]*/
  
                nextKeyframe = keyframes[ind + 1]
            
            let nextValue = nextKeyframe.value
            let nextTime = nextKeyframe.time
            
            let valDiff = nextValue - value
            let timDiff = nextTime - time
            
            let inc = valDiff / Float (timDiff)
            
            
            for frame in time..<nextTime
            {
                // add increment
                let newValue = value + inc * Float (frame - time)
                
                frames[frame] = newValue
            }
        }
        
        return frames
    }
}
