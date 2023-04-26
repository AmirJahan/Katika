import UIKit

extension ReadWrite
{
    class func getNewImgeUrl (imgId: String,
                              projectTitle: String) -> URL
    {
        let projUrl = getProjectUrl (title: projectTitle)
        //        let fileUrl = projUrl.appendingPathComponent(fileName)
        
        
        
        let fileName = "\(projectTitle)_\(imgId).jpg"
        
        let filePath = URL(fileURLWithPath: projUrl).appendingPathComponent(fileName)
        
        
        //        let fileUrl = projUrl.appendingPathComponent(fileName)
        
        //            print ("Audio is saved at: \(filePath)")
        
        return filePath
    }
}
