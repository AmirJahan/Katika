import UIKit

class AssetTransform: NSObject, NSCoding
{
    var positionString: String!
    var position: CGPoint!
    var rotation: Float!
    var scale: Float!
    
    init(position: CGPoint, rotation: Float, scale: Float)
    {
        self.position = position
        
        self.rotation = rotation
        self.scale = scale
    }
    
    func encode(with coder: NSCoder)
    {
        self.positionString = NSCoder.string (for: self.position)
        coder.encode(self.positionString, forKey: "positionString")
        coder.encode(NSNumber(value: self.rotation), forKey: "rotation")
        coder.encode(NSNumber(value: self.scale), forKey: "scale")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let positionString = coder.decodeObject(forKey: "positionString") as! String
        let position : CGPoint = NSCoder.cgPoint(for :positionString )
        
        let rotation = coder.decodeObject(forKey: "rotation") as! NSNumber
        let scale = coder.decodeObject(forKey: "scale") as! NSNumber
        
        
        self.init(position: position,
                  rotation: rotation.floatValue,
                  scale: scale.floatValue)
    }
}
