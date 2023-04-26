import Foundation


class User: NSObject, NSCoding
{
    var name: String
    
    init(name: String)
    {
        self.name = name
    }
    
    func encode(with coder: NSCoder)
    {
        coder.encode(self.name,
                     forKey:"name")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let name = coder.decodeObject(forKey: "name") as! String

        self.init (name: name)
    }
}
