import UIKit

extension ReadWrite
{
        class func getNewVoUrlFor (_ attempt: Int) -> URL
        {
            let projUrl = getProjectUrl (title: AppData.curProject!.title)
            
            let fileName = "\((AppData.curProject?.title)!)_\(attempt).m4a"
            let filePath = URL(fileURLWithPath: projUrl).appendingPathComponent(fileName)
            
            return filePath
        }
    
    class func getNewVoName (_ title: String, _ attempt: Int) -> String
    {
        
        let fileName = "\(title)_\(attempt).m4a"
        
        return fileName
    }
    
    class func buildVoUrl (title: String, name: String) -> URL
    {
        let projUrl = getProjectUrl (title: title)

        let recordingUrl: URL =
            URL(fileURLWithPath: projUrl).appendingPathComponent(name)
        
        return recordingUrl
    }
    
}
