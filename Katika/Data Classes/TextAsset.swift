import UIKit

class TextAsset: NSObject, NSCoding
{
    var text: String!
    var textColor: UIColor!
    var textSize: Float!

    init(text: String,
         textColor: UIColor,
         textSize: Float)
    {
        self.text = text
        self.textColor = textColor
        self.textSize = textSize
    }
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.text, forKey: "text")
        coder.encode(self.textColor, forKey: "textColor")
        coder.encode(self.textSize, forKey: "textSize")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let text = coder.decodeObject(forKey: "text") as! String
        let textColor = coder.decodeObject(forKey: "textColor") as! UIColor
        let textSize = coder.decodeObject(forKey: "textSize") as! NSNumber
        
        self.init(text: text,
                  textColor: textColor,
                  textSize: textSize.floatValue)
    }
}
