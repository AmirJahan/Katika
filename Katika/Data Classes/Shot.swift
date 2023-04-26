import UIKit

class Shot : NSObject, NSCoding
{
    var number: Int?
    var script: String?
    var scriptWords : [String]?
    
    var duration: Float?
    var startTime: Float?
    
//    var imgName: String?
//    var img: UIImage?
    
    var bgColor = UIColor.random
    var artworkSet: ArtworkSet = ArtworkSet(author: AppData.user)
        
//        ArtworkSet(author: AppData.user,
//                                            comment: "No Comment",
//                                            artworks: [],
//                                            imgName: "empty")
    
    var shotComments: [Comment] = []

//    var suggestions: [Shot] = []
    
    var suggestions: [ArtworkSet] = []
    
    
    init (number: Int,
          script: String?,
          scriptWords: [String]?,
          duration: Float?,
          startTime: Float?,
//          imgName: String?,
          bgColor: UIColor?)
//    ,
//          artworks: [Artwork])
//    ,suggestions : [Shot])
    {
        self.number = number
        self.script = script
        self.scriptWords = scriptWords
        self.duration = duration
        self.startTime = startTime
//        self.imgName = imgName
        self.bgColor = bgColor ?? UIColor.random
//        self.artworkSet = artworks
//        self.suggestions = suggestions
    }
    
    
    
    func encode(with coder: NSCoder)
    {
        if let myNum = self.number { coder.encode(myNum as NSNumber, forKey: "number") }
        if let myScr = self.script { coder.encode(myScr, forKey: "script") }
        if let myScW = self.scriptWords { coder.encode(myScW, forKey: "scriptWords") }
        if let muDur = self.duration
        {
//            print("encogin duration")
            coder.encode(NSNumber(value: muDur), forKey: "duration")
        }
        if let myStr = self.startTime
        {
//            print("encogin start Time")

            coder.encode(NSNumber(value: myStr), forKey: "startTime")
        }
//        if let myImN = self.imgName { coder.encode(myImN, forKey: "imgName") }
        
        coder.encode(self.bgColor, forKey: "bgColor")
        coder.encode(self.artworkSet, forKey: "artworks")
//        coder.encode(self.suggestions, forKey: "suggestions")
        coder.encode(self.shotComments, forKey: "shotComments")
        coder.encode(self.suggestions, forKey: "suggestions")
        coder.encode(self.artworkSet, forKey: "artworkSet")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let number = coder.decodeObject(forKey: "number") as? NSNumber
        
        self.init (number: number?.intValue ?? 0,
                   script: nil,
                   scriptWords: nil,
                   duration: nil,
                   startTime: nil,
//                   imgName: nil,
                   bgColor: nil
//            , artworks: []
            //, suggestions : []
        )
        
        if let script = coder.decodeObject(forKey: "script") as? String
        {
            self.script = script
        }
        
        if let  scriptWords = coder.decodeObject(forKey: "scriptWords") as? Array<String>
        {
            self.scriptWords = scriptWords
        }
        
        if let  duration = coder.decodeObject(forKey: "duration") as? NSNumber
        {
//            print ("found duration \(duration)")
            self.duration = duration.floatValue
        }
        
        if let  startTime = coder.decodeObject(forKey: "startTime") as? NSNumber
        {
//            print ("found startTime \(startTime)")
            self.startTime = startTime.floatValue
        }
        
//        if let  imgName = coder.decodeObject(forKey: "imgName") as? String
//        {
//            self.imgName = imgName
//        }
        
        if let  bgColor = coder.decodeObject(forKey: "bgColor") as? UIColor
        {
            self.bgColor = bgColor
        }
        
        if let artworkSet = coder.decodeObject(forKey: "artworkSet") as? ArtworkSet
        {
            self.artworkSet = artworkSet
        }
//        if let  suggestions = coder.decodeObject(forKey: "suggestions") as? Array<Shot>
//        {
//            self.suggestions = suggestions
//        }
        
        if let  shotComments = coder.decodeObject(forKey: "shotComments") as? Array<Comment>
        {
            self.shotComments = shotComments
        }
        
        if let suggestions = coder.decodeObject(forKey: "suggestions") as? Array<ArtworkSet>
        {
            self.suggestions = suggestions
        }
    }
}
