import Foundation

class VideoComment: NSObject, NSCoding
{
    var author: User
    var comment: String
    var date: Date
    var time: Float
    
     func encode(with coder: NSCoder)
        {
            coder.encode(self.author, forKey: "author")
            coder.encode(self.comment, forKey: "comment")
            
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd hh:mm:ss"
            let dateString = df.string(from: date)
            
            
        coder.encode(dateString, forKey: "dateString")
        coder.encode(NSNumber(value: time), forKey: "time")
    }
        
        required convenience init?(coder: NSCoder)
        {
            let author = coder.decodeObject(forKey: "author") as! User
            let comment = coder.decodeObject(forKey: "comment") as! String
            let dateString = coder.decodeObject(forKey: "dateString") as! String

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            let date = dateFormatter.date(from:dateString)!
            
            let time = coder.decodeObject(forKey: "time") as! NSNumber

            self.init(author: author,
                      comment: comment,
                      date: date,
                      time: time.floatValue)
        }

    
    init (author: User, comment: String, date: Date, time: Float)
    {
        self.author = author
        self.comment = comment
        self.date = date
        self.time = time
    }
}
