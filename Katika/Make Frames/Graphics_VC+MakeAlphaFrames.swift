import UIKit

extension MakeFrames
{
    class func makeAlphaFrames (sel: Artwork, shot: Shot, transitionLength: Float)
    {
        sel.alphaFrames = makeTheFramesFor(obj: sel,
                         of: sel.alphaKeyframes
        , shot: shot,
        transitionLength: transitionLength)
    }
}
