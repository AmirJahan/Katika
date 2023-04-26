import UIKit

extension ReadWrite
{
    class func getProjectUrl (title: String) -> String
        {
            let docsPath: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!

            // create the custom folder path
            let projectFolderPath = docsPath.appending("/\(title)")
            
    //        print ("Path is: \(projectFolderPath)")
            
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: projectFolderPath) {
                do {
                    try fileManager.createDirectory(atPath: projectFolderPath,
                                                    withIntermediateDirectories: false,
                                                    attributes: nil)
                } catch {
                    print("Error creating images folder in documents dir: \(error)")
                }
            }
            
            return projectFolderPath
        }
}
