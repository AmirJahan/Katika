import UIKit

class MakeFrames
{
    class func makeAllFrames (shot: Shot, transitionLength: Float)
    {
        for artwork in shot.artworkSet.artworks
        {
            makeFramesFor (artwork,
                           shot: shot,
                           transitionLength: transitionLength)
        }
    }
    
    class func makeFramesFor (_ artwork : Artwork,
                              shot: Shot,
                              transitionLength: Float)
    {
        makePositionFrames(sel: artwork,
                           shot: shot,
                           transitionLength: transitionLength)
        makeRotationFrames(sel: artwork,
                           shot: shot,
                           transitionLength: transitionLength)
        makeScaleFrames(sel: artwork,
                        shot: shot,
                        transitionLength: transitionLength)
        makeAlphaFrames(sel: artwork,
                        shot: shot,
                        transitionLength: transitionLength)
    }
}
