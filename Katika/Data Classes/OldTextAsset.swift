//import UIKit
//
//class OldTextAsset: NSObject, NSCoding
//{
//    var text: String!
//    var textColor: UIColor!
//    var textSize: Float!
//    
//    
//    var frameString: String!
//    var transform: AssetTransform!
//
//    init(text: String,
//         textColor: UIColor,
//         textSize: Float,
//         frameString: String,
//         transform: AssetTransform)
//    {
//        self.text = text
//        self.textColor = textColor
//        self.textSize = textSize
//        self.frameString = frameString
//        self.transform = transform
//    }
//    
//    func encode(with coder: NSCoder)
//    {
//        coder.encode(self.text, forKey: "text")
//        coder.encode(self.textColor, forKey: "textColor")
//        coder.encode(self.textSize, forKey: "textSize")
//        coder.encode(self.frameString, forKey: "frameString")
//        coder.encode(self.transform, forKey: "transform")
//    }
//    
//    required convenience init?(coder: NSCoder)
//    {
//        let text = coder.decodeObject(forKey: "text") as! String
//        let textColor = coder.decodeObject(forKey: "textColor") as! UIColor
//        let textSize = coder.decodeObject(forKey: "textSize") as! NSNumber
//        let frameString = coder.decodeObject(forKey: "frameString") as! String
//        let transform = coder.decodeObject(forKey: "transform") as! AssetTransform
//        
//        self.init(text: text,
//                  textColor: textColor,
//                  textSize: textSize.floatValue,
//                  frameString: frameString,
//                  transform: transform)
//    }
//}
