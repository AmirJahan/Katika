import UIKit

extension Graphics_VC
{
    func addImage (img: UIImage)
    {
//        let frame = CGRect (x: 0,
//                            y: 0,
//                            width: mainCanvas.bounds.size.height - 100.0,
//                            height: mainCanvas.bounds.size.height - 100.0)
        
        let imgView = UIImageView(image: img)
        
        let preferredHeight = mainCanvas.bounds.size.height - 100.0
        let newWidth = preferredHeight / imgView.bounds.height * imgView.bounds.width
        
        
        let newSize = CGSize (width: newWidth,
                              height: preferredHeight)
        
        imgView.frame.size = newSize
        
        let cen = CGPoint(x: mainCanvas.bounds.size.width / 2.0,
                          y: mainCanvas.bounds.size.height / 2.0)
        
        imgView.center = cen
        
        imgView.image = img
        let imgFrameStr = NSCoder.string(for: imgView.frame)

        let trans = AssetTransform(position: cen,
                                   rotation: 0.0,
                                   scale: 1.0)
        
        let imgName = ReadWrite.saveImageAndGetName(img, nil)
        let imageAsset = ImageAsset(path: imgName)
        
//                                    rotation: 0.0,
//                                    scale : 1.0,
//                                    positionString: NSCoder.string(for: cen))
        
        
        
        
        imgView.isUserInteractionEnabled = true
        let newArtwork = Artwork(type: ArtworkType.img,
                                 svg: nil,
                                 svgImgView: nil,
                                 txt: nil,
                                 textView: nil,
                                 img: imageAsset,
                                 imageView: imgView,
                                 frameString: imgFrameStr,
                                 transform: trans)

        
        shot.artworkSet.artworks.append(newArtwork)
        
        addAllGestures(v: imgView)


        
        mainCanvas.addSubview(imgView)
    }
}
