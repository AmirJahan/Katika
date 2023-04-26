import UIKit

extension MakeFrames
{
    class func makeRotationFrames (sel: Artwork, shot: Shot, transitionLength: Float)
    {
        sel.rotationFrames = makeTheFramesFor(obj: sel,
                         of: sel.rotationKeyframes,
                         shot: shot,
                         transitionLength: transitionLength)
    }
}
