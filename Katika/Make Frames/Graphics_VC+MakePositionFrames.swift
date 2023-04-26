import UIKit

extension MakeFrames
{
    class func makePositionFrames (sel: Artwork,
                                   shot: Shot,
                                   transitionLength: Float)
    {
        sel.xPositionframes = makeTheFramesFor(obj: sel,
                         of: sel.xPositionKeyframes,
                         shot: shot,
                         transitionLength: transitionLength)
        
        
        sel.yPositionframes = makeTheFramesFor(obj: sel,
                         of: sel.yPositionKeyframes,
                         shot: shot,
                         transitionLength: transitionLength)

    }
}
