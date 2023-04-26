import Foundation

class Voiceover: NSObject, NSCoding
{
    var name: String
    var fileName: String
    var duration: Float
    var selected: Bool = false
    
     func encode(with coder: NSCoder)
        {
            coder.encode(self.name, forKey: "name")
            coder.encode(self.fileName, forKey: "fileName")
            coder.encode(NSNumber(value: self.duration), forKey: "duration")
            coder.encode(self.selected as NSNumber, forKey: "selected")

        }
        
        required convenience init?(coder: NSCoder)
        {
            let name = coder.decodeObject(forKey: "name") as! String
            let fileName = coder.decodeObject(forKey: "fileName") as! String
            let duration = coder.decodeObject(forKey: "duration") as! NSNumber
            let selected = coder.decodeObject(forKey: "selected") as! NSNumber
           
//            print (selected)
            
            self.init(name: name,
                      fileName: fileName,
                      duration: duration.floatValue,
                      selected: selected.boolValue)
        }
    
    
    
    init (name: String, fileName: String, duration: Float, selected: Bool )
    {
        self.name = name
        self.fileName = fileName
        self.duration = duration
        self.selected = selected
    }
}
