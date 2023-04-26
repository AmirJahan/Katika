import UIKit
import PocketSVG

extension AssetSearch_VC
{
    func addSvgToCell (asset: SvgFile,
                       container: UIView)
    {
        let svgPath: String = Bundle.main.path(forResource: asset.path,
                                               ofType: "svg")!
        let url: URL = URL(fileURLWithPath: svgPath)
        
        
        print (url)
        let svgImageView = SVGImageView.init(contentsOf: url)
        svgImageView.frame = container.bounds.insetBy(dx: 10,
                                                      dy: 10)
        svgImageView.contentMode = UIView.ContentMode.scaleAspectFit
        container.addSubview(svgImageView)
    }
}
