import UIKit
import PocketSVG

extension ReadWrite
{
    class func fetchShot (shot: Shot, project: Project)
    {
//        shot.img = ReadWrite.imageForName(project.title,
//                                          shot.imgName!)
        
        if let setImgName = shot.artworkSet.imgName
        {
            shot.artworkSet.img = ReadWrite.imageForName(project.title,
                                                         setImgName)
        }
        
        for artwork in shot.artworkSet.artworks
        {
            // This was Added
            let frame : CGRect = NSCoder.cgRect(for: artwork.frameString)
            let trans = artwork.transform

            print ("Text frameString is: \(frame)")

            
            if let svgAsset = artwork.svgAsset
            {
                let assetPath = svgAsset.path!
                let builtPath: String =
                    Bundle.main.path(forResource: assetPath,
                                     ofType: "svg")!
                let url: URL = URL(fileURLWithPath: builtPath)
                
                let svgImgView = SVGImageView.init(contentsOf: url)
                svgImgView.contentMode = UIView.ContentMode.scaleAspectFit
                
                // this was removed
//                let frame : CGRect = NSCoder.cgRect(for: svgAsset.frameString)
                
                
                svgImgView.frame = frame
                
                
                artwork.svgImgView = svgImgView
                
  
                // this was removed
//                let trans = svgAsset.transform
                
                svgImgView.center = trans!.position
                
                let scale = CGFloat ( trans!.scale )
                let rotation = CGFloat(trans!.rotation)
                
                
                let transform = svgImgView.transform
                    .scaledBy(x: scale,
                              y: scale)
                    .rotated(by: rotation)
                
                svgImgView.transform = transform
            }
            if let txtAsset = artwork.txtAsset
            {
                // this was removed
//                let frame : CGRect = NSCoder.cgRect(for: txtAsset.frameString)
                
                let textView = UITextView(frame: frame)
                artwork.textView = textView
                textView.text = txtAsset.text
                textView.font = UIFont.systemFont(ofSize: CGFloat( txtAsset.textSize))
                textView.textColor = txtAsset.textColor
                textView.backgroundColor = UIColor.clear
                textView.textAlignment = .center
                
                // this was removed
//                let trans = txtAsset.transform
                
                textView.center = trans!.position
                

                let scale = CGFloat ( trans!.scale )
                
                let rotation = CGFloat(trans!.rotation)
                
                
                let transform = textView.transform
                    .scaledBy(x: scale,
                              y: scale)
                    .rotated(by: rotation)
                
                textView.transform = transform
                
                //                        textView.transform = textView.transform.rotated(by: CGFloat(trans!.rotation))
            }
            if let imgAsset = artwork.imgAsset
            {
                let image = ReadWrite.imageForName(project.title,
                                                   imgAsset.path)
                
                // this was removed
//                let frame : CGRect = NSCoder.cgRect(for: imgAsset.frameString)
                
                
                let imageView = UIImageView (frame: frame)
                artwork.imageView = imageView
                artwork.imageView?.image = image
                
                // this was removed
//                let trans = imgAsset.transform
                
                imageView.center = trans!.position
                
                let scale = CGFloat ( trans!.scale )
                let transform = imageView.transform
                    .scaledBy(x: scale,
                              y: scale)
                imageView.transform = transform
                
                imageView.transform = imageView.transform.rotated(by: CGFloat(trans!.rotation))
            }
        }
    }

    class func fetchProjectAssets ()
    {
        if let project = AppData.curProject
        {
            for shot in project.shots
            {
                fetchShot (shot: shot, project: project)
                
                for shotSuggestion in shot.suggestions
                {
                    fetchSuggestion(suggestion: shotSuggestion,
                                    project: project)
                }
            }
        }
    }

    class func fetchSuggestion (suggestion: ArtworkSet,
                                project: Project)
    {
        suggestion.img = ReadWrite.imageForName(project.title,
                                                suggestion.imgName!)

        for artwork in suggestion.artworks
        {
            
            // this was added
            let frame : CGRect = NSCoder.cgRect(for: artwork.frameString)
            let trans = artwork.transform

            if let svgAsset = artwork.svgAsset
            {
                let assetPath = svgAsset.path!
                let builtPath: String =
                    Bundle.main.path(forResource: assetPath,
                                     ofType: "svg")!
                let url: URL = URL(fileURLWithPath: builtPath)
                
                let svgImgView = SVGImageView.init(contentsOf: url)
                svgImgView.contentMode = UIView.ContentMode.scaleAspectFit
                
                // this was removed
//                let frame : CGRect = NSCoder.cgRect(for: svgAsset.frameString)
                
                svgImgView.frame = frame
                
                
                artwork.svgImgView = svgImgView
                
                // this was removed
//                let trans = svgAsset.transform
                
                svgImgView.center = trans!.position
                
                let scale = CGFloat ( trans!.scale )
                let rotation = CGFloat(trans!.rotation)
                
                let transform = svgImgView.transform
                    .scaledBy(x: scale,
                              y: scale)
                    .rotated(by: rotation)
                
                svgImgView.transform = transform
            }
            
            if let txtAsset = artwork.txtAsset
            {
                // this was removed
//                let frame : CGRect = NSCoder.cgRect(for: txtAsset.frameString)
                
                let textView = UITextView(frame: frame)
                artwork.textView = textView
                textView.text = txtAsset.text
                textView.font = UIFont.systemFont(ofSize: CGFloat( txtAsset.textSize))
                textView.textColor = txtAsset.textColor
                textView.backgroundColor = UIColor.clear
                textView.textAlignment = .center
                
                // this was removed
//                let trans = txtAsset.transform
                
                textView.center = trans!.position
                
                let scale = CGFloat ( trans!.scale )
                
                let rotation = CGFloat(trans!.rotation)
                
                
                let transform = textView.transform
                    .scaledBy(x: scale,
                              y: scale)
                    .rotated(by: rotation)
                
                textView.transform = transform
            }
            if let imgAsset = artwork.imgAsset
            {
                let image = ReadWrite.imageForName(project.title,
                                                   imgAsset.path)
                
                // this was removed
//                let frame : CGRect = NSCoder.cgRect(for: imgAsset.frameString)
                
                
                let imageView = UIImageView (frame: frame)
                artwork.imageView = imageView
                artwork.imageView?.image = image
                
                // this was removed
//                let trans = imgAsset.transform
                
                imageView.center = trans!.position
                
                let scale = CGFloat ( trans!.scale )
                let transform = imageView.transform
                    .scaledBy(x: scale,
                              y: scale)
                imageView.transform = transform

                imageView.transform = imageView.transform.rotated(by: CGFloat(trans!.rotation))
            }
        }
    }
}
