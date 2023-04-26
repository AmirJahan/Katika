import UIKit

extension Graphics_VC
{// this is a duplciate
    
    // there is a class for this
    
    
    
    func playArtworks (_ frame: Int)
    {        
        for artwork in shot.artworkSet.artworks
        {
            playThisArtwork (artwork, frame)
        }
    }
    
    func applyPosition (_ artwork: Artwork, _ frame: Int)
    {
        if let xPos = fetchChannelValue(of: artwork,
                                        at: frame,
                                        val: artwork.xPositionframes)
        {
            if let yPos = fetchChannelValue(of: artwork,
                                            at: frame,
                                            val: artwork.yPositionframes)
            {
                let center = CGPoint(x: CGFloat(xPos),
                                     y: CGFloat(yPos))
                
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
    
    func applyRotationAndScale (_ artwork: Artwork, _ frame: Int)
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
    
    
    func findRotation (_ artwork: Artwork,
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
    
    func findScale (_ artwork: Artwork, _ frame: Int) -> CGAffineTransform
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
    
    
    func applyAlpha (_ artwork: Artwork, _ frame: Int)
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
    
    func playThisArtwork (_ artwork: Artwork, _ frame: Int)
    {
        
        applyPosition (artwork, frame)
        applyRotationAndScale (artwork, frame)
        applyAlpha(artwork, frame)
    }
    
    func fetchChannelValue (of artwork: Artwork,
                            at frame: Int,
                            val channel: [Float]) -> Float?
    {
        if channel.count == 0 { return nil }
        
        let val =  channel[frame]
        
        return val
    }
}
