import UIKit





class Project : NSObject, NSCoding
{
    var title: String
    
    // defualt length of a project
    var length: Float = 5.0
    var script: String?
    
    var scriptComments: [Comment] = []
    var shotlistComments: [Comment] = []
    var videoComments: [VideoComment] = []
    
    var keywords : Array<String> = []

    var mainImageName: String?
    var projectImage: UIImage?
    
    var voiceOvers : [Voiceover] = []

    var shots : Array<Shot> = []



    var shotlListIsCurrent = false
    
    var scriptChanged = false
    
    
    init(title: String)
    {
        self.title = title
    }
    
    
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.title, forKey: "title")
        
        coder.encode(NSNumber(value: self.length),
                     forKey: "assumedLength")
        
        coder.encode(self.script, forKey: "script")

        if let myMainImg = mainImageName { coder.encode(myMainImg, forKey: "mainImageName") }
        
        coder.encode(self.voiceOvers,  forKey: "voiceOvers")


        coder.encode(self.shots,  forKey: "shots")
        coder.encode(self.scriptComments,  forKey: "scriptComments")
        coder.encode(self.videoComments,  forKey: "videoComments")
        coder.encode(self.shotlistComments,  forKey: "shotlistComments")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let title = coder.decodeObject(forKey: "title") as! String
        self.init(title: title)

        
        
        if let assumedLength = coder.decodeObject(forKey: "assumedLength") as? NSNumber
        { self.length = assumedLength.floatValue }

        if let script = coder.decodeObject(forKey: "script") as? String
        { self.script = script }
        
        if let voiceOvers = coder.decodeObject(forKey: "voiceOvers") as? Array<Voiceover>
        { self.voiceOvers = voiceOvers }
        
        if let shots = coder.decodeObject(forKey: "shots") as? Array<Shot>
        { self.shots = shots }
        
        if let scriptComments = coder.decodeObject(forKey: "scriptComments") as? Array<Comment>
        { self.scriptComments = scriptComments }
        
        if let shotlistComments = coder.decodeObject(forKey: "shotlistComments") as? Array<Comment>
        { self.shotlistComments = shotlistComments }
        
        if let videoComments = coder.decodeObject(forKey: "videoComments") as? Array<VideoComment>
        { self.videoComments = videoComments }
        
        
        
//
        if let mainImageName = coder.decodeObject(forKey: "mainImageName") as? String {
            self.mainImageName = mainImageName
            self.projectImage = ReadWrite.imageForName(title,
                                                       mainImageName)
        }
    }
}
