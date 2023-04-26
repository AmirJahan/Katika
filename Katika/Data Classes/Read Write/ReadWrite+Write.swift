import UIKit

extension ReadWrite
{
    class func write ()
    {
        guard let title = AppData.curProject?.title else {return}
        guard let project = AppData.curProject else {return}
        
        //        let projectPath: URL = docsURL.appendingPathComponent("\(title).plist")
        let projUrl = getProjectUrl (title: title)
        let fileName = "\(title).plist"
        //        let fileUrl = projUrl.appendingPathComponent(fileName)
        
        let projectPath = URL(fileURLWithPath: projUrl).appendingPathComponent(fileName)
        //        let projectPath = projUrl.appendingPathComponent(fileName)
        
        //        print ("trying to wite to: \(projectPath)")
        
        if let myArchiver = try? NSKeyedArchiver.archivedData(withRootObject: project,
                                                              requiringSecureCoding: false)
        {
            //            print ("archiver wWhat is bitcoinorked")
            do {
                try myArchiver.write(to: projectPath)
            }
            catch
            {
                print("Something went wrong \(error)")
            }
        }
        //        print ("write: \(projectPath)")
    }
}
