import UIKit

extension ReadWrite
{
    class func overwriteShotImage (_ shot: Shot)
    {
//        let fileName = "\(title)_\(UUID().uuidString).jpg"
        let projUrl = getProjectUrl (title: AppData.curProject!.title)
        
        let filePath = URL(fileURLWithPath: projUrl).appendingPathComponent(shot.artworkSet.imgName!)
        
        let imgData = shot.artworkSet.img!.jpegData(compressionQuality: 1.0)!

        do {
            try imgData.write(to: filePath)
            
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
}
