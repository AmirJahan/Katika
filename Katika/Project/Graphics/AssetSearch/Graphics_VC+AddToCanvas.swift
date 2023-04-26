import UIKit
import PocketSVG

extension Graphics_VC
{
    func addToCanvas (asset: SvgFile, container: UIView)
    {
        let assetPath = asset.path!
        
        let builtPath: String = Bundle.main.path(forResource: assetPath,
                                                 ofType: "svg")!
        let url: URL = URL(fileURLWithPath: builtPath)
        
        
        let svg = SVGImageView.init(contentsOf: url)
        let heightFrame = CGRect (x: 0,
                                  y: 0,
                                  width: container.bounds.size.height - 100.0,
                                  height: container.bounds.size.height - 100.0)
        
        svg.frame = heightFrame
        
        let cen = CGPoint(x: container.bounds.size.width / 2.0,
        y: container.bounds.size.height / 2.0)
        svg.center = cen
        
        svg.contentMode = UIView.ContentMode.scaleAspectFit
        container.addSubview(svg)
        
        let svgFrameStrin = NSCoder.string(for: svg.frame)
        
        
        
        let trans = AssetTransform (position: cen, rotation: 0.0, scale: 1.0)
        
        let svgAsset = SvgAsset(path: assetPath)
        
        let newArtwork = Artwork (type: ArtworkType.svg,
                                  svg: svgAsset,
                                  svgImgView: svg,
                                  txt: nil,
                                  textView: nil,
                                  img: nil,
                                  imageView: nil,
                                  frameString: svgFrameStrin,
                                  transform: trans)

        
        shot.artworkSet.artworks.append(newArtwork)
        
        addAllGestures(v: svg)

        
        container.addSubview(svg)
    }
}
