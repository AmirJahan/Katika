import UIKit
import PocketSVG

extension Graphics_VC: SearchedAssetDelegate
{
    func assetSelected(_ asset: SvgFile)
    {
        addToCanvas(asset: asset,
                    container: self.mainCanvas)
    }
}
