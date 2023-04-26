import UIKit

extension MakeFrames
{
    class func makeScaleFrames (sel: Artwork, shot: Shot, transitionLength: Float)
    {
        sel.xScaleframes = makeTheFramesFor(obj: sel,
                         of: sel.xScaleKeyframes,
                         shot: shot,
                         transitionLength: transitionLength)
        
        sel.yScaleframes = makeTheFramesFor(obj: sel,
                         of: sel.yScaleKeyframes,
                         shot: shot,
                         transitionLength: transitionLength)
    }
}
