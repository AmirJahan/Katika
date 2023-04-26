import Foundation
import PocketSVG

extension Graphics_VC
{
    func updateArtworkAssets ()
    {
        for artwork in shot.artworkSet.artworks
        {
            if let svgView = artwork.svgImgView
            {
                let radians = atan2(svgView.transform.b,
                                    svgView.transform.a)
                
                // this was removed
//                artwork.svgAsset?.transform.position = svgView.center

                // this was added
                artwork.transform.position = svgView.center

                
                // this was removed
//                artwork.svgAsset?.transform.rotation = Float(radians)
                
                // this was added
                artwork.transform.rotation = Float(radians)

            }
            if let txtView = artwork.textView
            {
                artwork.txtAsset?.textColor = txtView.textColor

                artwork.txtAsset?.text = txtView.text
                
                // this was removed
//                artwork.txtAsset?.transform.position = txtView.center

                // this was added
                artwork.transform.position = txtView.center

                
                let radians = atan2(txtView.transform.b,
                                    txtView.transform.a)

                // this was removed
//                artwork.txtAsset?.transform.rotation = Float(radians)
                
                // this was added
                artwork.transform.rotation = Float(radians)
                
            }
            if let imgView = artwork.imageView
            {
                let radians = atan2(imgView.transform.b,
                                    imgView.transform.a)

                // this was removed
//                artwork.imgAsset?.transform.rotation = Float(radians)
//                artwork.imgAsset?.transform.position = imgView.center
                
                // this was added
                artwork.transform.rotation = Float(radians)
                artwork.transform.position = imgView.center
            } 
        }
    }
}
