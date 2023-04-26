import UIKit

extension ReadWrite
{
    class func readProjectWithTitle (title: String) -> Project?
    {
        let projUrl = getProjectUrl (title: title)
        let projectPath = URL(fileURLWithPath: projUrl).appendingPathComponent("\(title).plist")
        
        //        let projectPath: URL = projUrl.appendingPathComponent("\(title).plist")
        
        
        //        print ("read: \(projectPath)")
        
        guard let data = try? Data(contentsOf: projectPath) else { return nil }
        
        do {
            if let project = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Project
            {
              
                
                return project
            }
        } catch {
            print("Couldn't read file.")
        }
        
        return nil
    }
}
