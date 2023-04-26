import UIKit

extension Graphics_VC
{
    func addText ()
    {
        let frame = CGRect (x: 0,
                                  y: 0,
                                  width: mainCanvas.bounds.size.height - 100.0,
                                  height: 64)
        
        let textView = UITextView(frame: frame)
        textView.text = "Hold Click to Edit Text"
        textView.font = UIFont.systemFont(ofSize: 24)
        textView.textAlignment = .center
        textView.backgroundColor = .clear
        textView.delegate = self
        
        textView.textColor = UIColor.black
        
        mainCanvas.addSubview( textView)
        
        mainCanvas.layoutIfNeeded()
        let cen = CGPoint(x: mainCanvas.bounds.size.width / 2.0,
        y: mainCanvas.bounds.size.height / 3.0)
        textView.center = cen
        
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        
        
        let textFrameStr = NSCoder.string(for: textView.frame)
        
        
        let trans = AssetTransform (position: cen, rotation: 0.0, scale: 1.0)
        
        let textAsset = TextAsset(text: "Hold Touch to Edit",
                                  textColor: UIColor.black,
                                  textSize: 24.0)
        
        
        let newArtwork = Artwork(type: ArtworkType.text,
                                 svg: nil,
                                 svgImgView: nil,
                                 txt: textAsset,
                                 textView: textView,
                                 img: nil,
                                 imageView: nil,
                                 frameString: textFrameStr,
                                 transform: trans)

        
        shot.artworkSet.artworks.append(newArtwork)
        
        textView.sizeToFit()
        
        
        addAllGestures(v: textView)

        
        mainCanvas.addSubview(textView)
    }
}
