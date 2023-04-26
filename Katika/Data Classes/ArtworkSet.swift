import UIKit

import Foundation

class ArtworkSet: NSObject, NSCoding
{
    var author: User
    
    var bgColor = UIColor.random
    var artworks: [Artwork] = []
    var comment: String = "No Comment Yet"
    var imgName: String?
    var img: UIImage?

    func encode(with coder: NSCoder)
    {
        coder.encode(self.author, forKey: "author")
        coder.encode(self.comment, forKey: "comment")
        coder.encode(self.artworks, forKey: "artworks")
        coder.encode(self.imgName, forKey: "imgName")
        
        coder.encode(self.bgColor, forKey: "bgColor")

    }
    
    required convenience init?(coder: NSCoder)
    {
        let author = coder.decodeObject(forKey: "author") as! User
        let comment = coder.decodeObject(forKey: "comment") as! String
        
        let artworks = coder.decodeObject(forKey: "artworks") as! Array<Artwork>
        
        let imgName = coder.decodeObject(forKey: "imgName") as! String
        
        let bgColor = coder.decodeObject(forKey: "bgColor") as! UIColor
  
        
        self.init(author: author)
        
        self.comment = comment
        self.artworks = artworks
        self.imgName = imgName
        self.bgColor = bgColor
    }
    
    
    init (author: User)
    {
        self.author = author
    }
}
