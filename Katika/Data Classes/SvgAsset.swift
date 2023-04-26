import Foundation
import UIKit
class SvgAsset: NSObject, NSCoding
{
    var path: String!
    
    init(path: String)
    {
        self.path = path
    }
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.path, forKey: "path")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let path = coder.decodeObject(forKey: "path") as! String

        self.init(path: path)
    }
}



