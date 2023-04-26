import Foundation
import UIKit
import PocketSVG

class Artwork: NSObject, NSCoding
{
    var type: ArtworkType
    var locked = false

    var svgAsset: SvgAsset?
    var svgImgView: SVGImageView?
    
    var txtAsset: TextAsset?
    var textView: UITextView?
    
    var imgAsset: ImageAsset?
    var imageView: UIImageView?
    
    var xPositionKeyframes : [Keyframe] = []
    var xPositionframes : [Float] = []

    var yPositionKeyframes : [Keyframe] = []
    var yPositionframes : [Float] = []
    
    var rotationKeyframes : [Keyframe] = []
    var rotationFrames : [Float] = []


    var xScaleKeyframes : [Keyframe] = []
    
    var xScaleframes : [Float] = []
    
    var yScaleKeyframes : [Keyframe] = []

    var yScaleframes : [Float] = []

    var alphaKeyframes : [Keyframe] = []
    var alphaFrames : [Float] = []

    var frameString: String!
    var transform: AssetTransform!
    
    
    init(type: ArtworkType,
         svg: SvgAsset?,
         svgImgView: SVGImageView?,
         txt: TextAsset?,
         textView: UITextView?,
         img: ImageAsset?,
         imageView: UIImageView?,
         frameString: String,
         transform: AssetTransform)
    {
        self.type = type
        self.svgAsset = svg
        self.svgImgView = svgImgView
        self.txtAsset = txt
        self.textView = textView
        self.imgAsset = img
        self.imageView = imageView
        
        self.frameString = frameString
        self.transform = transform
    }
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.type.rawValue, forKey:"type")
        
        if let mySvg = self.svgAsset { coder.encode(mySvg, forKey: "svgAsset")
            
            self.frameString = NSCoder.string(for: svgImgView!.frame)

        }
        if let myTxt = self.txtAsset { coder.encode(myTxt, forKey: "txtAsset")
            
            self.frameString = NSCoder.string(for: textView!.frame)

        }
        if let myImg = self.imgAsset { coder.encode(myImg, forKey: "imgAsset")
            self.frameString = NSCoder.string(for: imageView!.frame)

        }
        
//        print ("encoding frameString is: \(self.frameString)")

        
        
        coder.encode(self.frameString, forKey: "frameString")
        coder.encode(self.transform, forKey: "transform")
        
        
        coder.encode(self.xPositionKeyframes, forKey: "xPositionKeyframes")
        coder.encode(self.yPositionKeyframes, forKey: "yPositionKeyframes")
        
        coder.encode(self.rotationKeyframes, forKey: "rotationKeyframes")
        
        coder.encode(self.xScaleKeyframes, forKey: "xScaleKeyframes")
        coder.encode(self.yScaleKeyframes, forKey: "yScaleKeyframes")

        coder.encode(self.alphaKeyframes, forKey: "alphaKeyframes")

    }
    
    required convenience init?(coder: NSCoder)
    {
        let type = ArtworkType(rawValue: coder.decodeObject(forKey: "type") as! String)!
        
        let frameString = coder.decodeObject(forKey: "frameString") as! String
        let transform = coder.decodeObject(forKey: "transform") as! AssetTransform
        
        
        self.init (type: type,
                   svg: nil,
                   svgImgView: nil,
                   txt: nil,
                   textView: nil,
                   img: nil,
                   imageView: nil,
                   frameString: frameString,
                   transform: transform)
        
        if let mySvgAsset = coder.decodeObject(forKey: "svgAsset") as? SvgAsset
        {
            self.svgAsset = mySvgAsset
        }
        if let  myTxtAsset = coder.decodeObject(forKey: "txtAsset") as? TextAsset
        {
            self.txtAsset = myTxtAsset
        }
        if let  myImgAsset = coder.decodeObject(forKey: "imgAsset") as? ImageAsset
        {
            self.imgAsset = myImgAsset
        }
        let locked = coder.decodeBool(forKey: "locked")
        
            self.locked = locked
        
        
        
        if let xPositionKeyframes = coder.decodeObject(forKey: "xPositionKeyframes") as? [Keyframe]
        {
            self.xPositionKeyframes = xPositionKeyframes
        }
        
        if let yPositionKeyframes = coder.decodeObject(forKey: "yPositionKeyframes") as? [Keyframe]
        {
            self.yPositionKeyframes = yPositionKeyframes
        }
        
        
        if let rotationKeyframes = coder.decodeObject(forKey: "rotationKeyframes") as? [Keyframe]
        {
            self.rotationKeyframes = rotationKeyframes
        }
        

        
        if let xScaleKeyframes = coder.decodeObject(forKey: "xScaleKeyframes") as? [Keyframe]
        {
            self.xScaleKeyframes = xScaleKeyframes
        }
        
        if let yScaleKeyframes = coder.decodeObject(forKey: "yScaleKeyframes") as? [Keyframe]
        {
            self.yScaleKeyframes = yScaleKeyframes
        }
        
        
        if let alphaKeyframes = coder.decodeObject(forKey: "alphaKeyframes") as? [Keyframe]
        {
            self.alphaKeyframes = alphaKeyframes
        }


        
    }
}
