import UIKit

extension ReadWrite
{
    class func overwriteProjectImage ()
    {
//        let fileName = "\(title)_\(UUID().uuidString).jpg"
        
        guard let project = AppData.curProject else { return }
        guard let imgName = project.mainImageName else { return }
        guard let img = project.projectImage else { return }

        let projUrl = getProjectUrl (title: project.title)
        
        let filePath = URL(fileURLWithPath: projUrl).appendingPathComponent(imgName)
        
        let imgData = img.jpegData(compressionQuality: 1.0)!

        do {
            try imgData.write(to: filePath)
            
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
}
