import UIKit

class PlayArtworks
{
    class func playAll (_ frame: Int,
                        in shot: Shot)
    {
        for artwork in shot.artworkSet.artworks
        {
            playThisArtwork (artwork, frame)
        }
    }
    
    class func playThisArtwork (_ artwork: Artwork,
                                _ frame: Int)
    {
        applyPosition (artwork, frame)
        applyRotationAndScale (artwork, frame)
        applyAlpha(artwork, frame)
        applyScale(artwork, frame)
    }
    
    
    class func applyPosition (_ artwork: Artwork,
                              _ frame: Int)
    {
        if let xPos = fetchChannelValue(of: artwork,
                                        at: frame,
                                        val: artwork.xPositionframes)
        {
            if let yPos = fetchChannelValue(of: artwork,
                                            at: frame, val: artwork.yPositionframes)
            {
                let center = CGPoint(x: CGFloat(xPos), y: CGFloat(yPos))
                
                if let svg = artwork.svgImgView
                {
                    svg.center = center
                }
                else if let img = artwork.imageView
                {
                    img.center = center
                }
                if let txt = artwork.textView
                {
                    txt.center = center
                }
            }
        }
    }
    
    class func applyScale (_ artwork: Artwork,
                           _ frame: Int)
    {
        if let xScl = fetchChannelValue(of: artwork,
                                        at: frame,
                                        val: artwork.xScaleframes)
        {
            if let yScl = fetchChannelValue(of: artwork,
                                            at: frame,
                                            val: artwork.yScaleframes)
            {
                let scale = CGPoint(x: CGFloat(xScl), y: CGFloat(yScl))
                
                print ("scale is : \(scale)")
                
                if let svg = artwork.svgImgView
                {
                    // this was removed
//                    svg.center = center
                    
                    
                    // this block was added
                    let scaleCenter = CGPoint(x: svg.bounds.midX,
                                              y: svg.bounds.midY)
                    let transform = svg.transform.translatedBy(x: scaleCenter.x,
                                                               y: scaleCenter.y)
                        .scaledBy(x: scale.x,
                                  y: scale.y)
                        .translatedBy(x: -scaleCenter.x,
                                      y: -scaleCenter.y)
                    svg.transform = transform
                    
                    
                }
                else if let img = artwork.imageView
                {
                    // this was removed
//                    img.center = center
                    
                    // this block was added
                    let scaleCenter = CGPoint(x: img.bounds.midX,
                                              y: img.bounds.midY)
                    let transform = img.transform.translatedBy(x: scaleCenter.x,
                                                               y: scaleCenter.y)
                        .scaledBy(x: scale.x,
                                  y: scale.y)
                        .translatedBy(x: -scaleCenter.x,
                                      y: -scaleCenter.y)
                    img.transform = transform
                }
                if let txt = artwork.textView
                {
                    // this was removed
//                    txt.center = center
                    
                    // this block was added
                    let scaleCenter = CGPoint(x: txt.bounds.midX,
                                              y: txt.bounds.midY)
                    let transform = txt.transform.translatedBy(x: scaleCenter.x,
                                                               y: scaleCenter.y)
                        .scaledBy(x: scale.x,
                                  y: scale.y)
                        .translatedBy(x: -scaleCenter.x,
                                      y: -scaleCenter.y)
                    txt.transform = transform
                }
            }
        }
    }
    
    class func applyRotationAndScale (_ artwork: Artwork, _ frame: Int)
    {
        // rotation
        if let _ = fetchChannelValue(of: artwork,
                                     at: frame,
                                     val: artwork.rotationFrames)
        {
            let rot = findRotation(artwork, frame)
            // and scale
            if let _ = fetchChannelValue(of: artwork,
                                         at: frame,
                                         val: artwork.yScaleframes)
            {
                let scale = findScale(artwork, frame)
                
                if let svg = artwork.svgImgView {
                    svg.transform = scale.concatenating(rot)
                }
                else if let img = artwork.imageView {
                    img.transform = scale.concatenating(rot)
                }
                if let txt = artwork.textView {
                    txt.transform = scale.concatenating(rot)
                }
            }
            else
            {
                if let svg = artwork.svgImgView {
                    svg.transform = rot
                }
                else if let img = artwork.imageView {
                    img.transform = rot
                }
                if let txt = artwork.textView {
                    txt.transform = rot
                }
            }
        }
        else if let _ = fetchChannelValue(of: artwork,
                                          at: frame,
                                          val: artwork.yScaleframes)
        {
            let scale = findScale(artwork, frame)
            
            if let svg = artwork.svgImgView {
                svg.transform = scale
            }
            else if let img = artwork.imageView {
                img.transform = scale
            }
            if let txt = artwork.textView {
                txt.transform = scale
            }
        }
    }
    
    
    class func findRotation (_ artwork: Artwork,
                             _ frame: Int) -> CGAffineTransform
    {
        var rotTarns = CGAffineTransform()
        
        if let rot = fetchChannelValue(of: artwork,
                                       at: frame,
                                       val: artwork.rotationFrames)
        {
            let rotation = CGFloat(rot)
            rotTarns = CGAffineTransform(rotationAngle: rotation)
        }
        
        return rotTarns
    }
    
    class func findScale (_ artwork: Artwork, _ frame: Int) -> CGAffineTransform
    {
        var sclTarns = CGAffineTransform()
        
        
        if let xScl = fetchChannelValue(of: artwork, at: frame, val: artwork.xScaleframes)
        {
            // scale only
            if let yscl = fetchChannelValue(of: artwork, at: frame, val: artwork.yScaleframes)
            {
                let scale = CGPoint (x: CGFloat(xScl), y: CGFloat(yscl))
                sclTarns = CGAffineTransform(scaleX: scale.x,
                                             y: scale.y)
            }
        }
        
        return sclTarns
    }
    
    
    class func applyAlpha (_ artwork: Artwork, _ frame: Int)
    {
        if let alp = fetchChannelValue(of: artwork, at: frame, val: artwork.alphaFrames)
        {
            let alpha = CGFloat (alp)
            if let svg = artwork.svgImgView
            {
                svg.alpha = alpha
            }
            else if let img = artwork.imageView
            {
                img.alpha = alpha
            }
            if let txt = artwork.textView
            {
                txt.alpha = alpha
            }
        }
    }
    
    
    
    class func fetchChannelValue (of artwork: Artwork,
                                  at frame: Int,
                                  val channel: [Float]) -> Float?
    {
        if channel.count == 0 { return nil }
        if frame < 0 { return 0.0}
        let val =  channel[frame]
        
        return val
    }
}
