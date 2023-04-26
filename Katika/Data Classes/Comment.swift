import Foundation

class Comment: NSObject, NSCoding
{
    var author: User
    var comment: String
    var date: Date
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.author, forKey: "author")
        coder.encode(self.comment, forKey: "comment")
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let dateString = df.string(from: date)
        
        
        coder.encode(dateString, forKey: "dateString")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let author = coder.decodeObject(forKey: "author") as! User
        let comment = coder.decodeObject(forKey: "comment") as! String
        let dateString = coder.decodeObject(forKey: "dateString") as! String
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = dateFormatter.date(from:dateString)!
        
        
        self.init(author: author,
                  comment: comment,
                  date: date)
    }
    
    
    init (author: User, comment: String, date: Date)
    {
        self.author = author
        self.comment = comment
        self.date = date
    }
}
