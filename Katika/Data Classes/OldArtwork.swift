//import Foundation
//import UIKit
//import PocketSVG
//
//class OldArtwork: NSObject, NSCoding
//{
//    var type: ArtworkType
//    var locked = false
//
//    var svgAsset: OldSvgAsset?
//    var svgImgView: SVGImageView?
//    
//    var txtAsset: OldTextAsset?
//    var textView: UITextView?
//    
//    var imgAsset: OldImageAsset?
//    var imageView: UIImageView?
//    
//    var xPositionKeyframes : [Keyframe] = []
//    var xPositionframes : [Float] = []
//
//    var yPositionKeyframes : [Keyframe] = []
//    var yPositionframes : [Float] = []
//    
//    var rotationKeyframes : [Keyframe] = []
//    var rotationFrames : [Float] = []
//
//
//    var xScaleKeyframes : [Keyframe] = []
//    
//    var xScaleframes : [Float] = []
//    
//    var yScaleKeyframes : [Keyframe] = []
//
//    var yScaleframes : [Float] = []
//
//    var alphaKeyframes : [Keyframe] = []
//    var alphaFrames : [Float] = []
//
//    
//    init(type: ArtworkType,
//         svg: OldSvgAsset?,
//         svgImgView: SVGImageView?,
//         txt: OldTextAsset?,
//         textView: UITextView?,
//         img: OldImageAsset?,
//         imageView: UIImageView?)
//    {
//        self.type = type
//        self.svgAsset = svg
//        self.svgImgView = svgImgView
//        self.txtAsset = txt
//        self.textView = textView
//        self.imgAsset = img
//        self.imageView = imageView
//    }
//    
//    func encode(with coder: NSCoder)
//    {
//        coder.encode(self.type.rawValue, forKey:"type")
//        
//        if let mySvg = self.svgAsset { coder.encode(mySvg, forKey: "svgAsset") }
//        if let myTxt = self.txtAsset { coder.encode(myTxt, forKey: "txtAsset") }
//        if let myImg = self.imgAsset { coder.encode(myImg, forKey: "imgAsset") }
//        
//        coder.encode(self.xPositionKeyframes, forKey: "xPositionKeyframes")
//        coder.encode(self.yPositionKeyframes, forKey: "yPositionKeyframes")
//        
//        coder.encode(self.rotationKeyframes, forKey: "rotationKeyframes")
//        
//        coder.encode(self.xScaleKeyframes, forKey: "xScaleKeyframes")
//        
//        coder.encode(self.alphaKeyframes, forKey: "alphaKeyframes")
//
//    }
//    
//    required convenience init?(coder: NSCoder)
//    {
//        let type = ArtworkType(rawValue: coder.decodeObject(forKey: "type") as! String)!
//        
//        self.init (type: type,
//                   svg: nil,
//                   svgImgView: nil,
//                   txt: nil,
//                   textView: nil,
//                   img: nil,
//                   imageView: nil)
//        
//        if let mySvgAsset = coder.decodeObject(forKey: "svgAsset") as? OldSvgAsset
//        {
//            self.svgAsset = mySvgAsset
//        }
//        if let  myTxtAsset = coder.decodeObject(forKey: "txtAsset") as? OldTextAsset
//        {
//            self.txtAsset = myTxtAsset
//        }
//        if let  myImgAsset = coder.decodeObject(forKey: "imgAsset") as? OldImageAsset
//        {
//            self.imgAsset = myImgAsset
//        }
//        let locked = coder.decodeBool(forKey: "locked")
//        
//            self.locked = locked
//        
//        
//        
//        if let xPositionKeyframes = coder.decodeObject(forKey: "xPositionKeyframes") as? [Keyframe]
//        {
//            self.xPositionKeyframes = xPositionKeyframes
//        }
//        
//        if let yPositionKeyframes = coder.decodeObject(forKey: "yPositionKeyframes") as? [Keyframe]
//        {
//            self.yPositionKeyframes = yPositionKeyframes
//        }
//        
//        
//        if let rotationKeyframes = coder.decodeObject(forKey: "rotationKeyframes") as? [Keyframe]
//        {
//            self.rotationKeyframes = rotationKeyframes
//        }
//        
//
//        
//        if let xScaleKeyframes = coder.decodeObject(forKey: "xScaleKeyframes") as? [Keyframe]
//        {
//            self.xScaleKeyframes = xScaleKeyframes
//        }
//        
//        if let yScaleKeyframes = coder.decodeObject(forKey: "yScaleKeyframes") as? [Keyframe]
//        {
//            self.yScaleKeyframes = yScaleKeyframes
//        }
//        
//        
//        if let alphaKeyframes = coder.decodeObject(forKey: "alphaKeyframes") as? [Keyframe]
//        {
//            self.alphaKeyframes = alphaKeyframes
//        }
//
//
//        
//    }
//}
