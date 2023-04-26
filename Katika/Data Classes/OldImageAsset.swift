//import UIKit
//
//class OldImageAsset: NSObject, NSCoding
//{
//    var path: String!
//    
//    
//    var frameString: String!
//    var transform: AssetTransform!
//    
//    init(path: String,
//         frameString: String,
//         transform: AssetTransform)
//    {
//        self.path = path
//        self.frameString = frameString
//        self.transform = transform
//    }
//    
//    func encode(with coder: NSCoder)
//    {
//        coder.encode(self.path, forKey: "path")
//        coder.encode(self.frameString, forKey: "frameString")
//        coder.encode(self.transform, forKey: "transform")
//    }
//    
//    required convenience init?(coder: NSCoder)
//    {
//        let path = coder.decodeObject(forKey: "path") as! String
//        let frameString = coder.decodeObject(forKey: "frameString") as! String
//        let transform = coder.decodeObject(forKey: "transform") as! AssetTransform
//        
//        self.init(path: path,
//                  frameString: frameString,
//                  transform: transform)
//    }
//}
//
//
//
