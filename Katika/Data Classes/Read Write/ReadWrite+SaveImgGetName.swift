import UIKit


extension ReadWrite
{
    class func saveImageAndGetName (_ shotImage: UIImage,
                                   _ projTitle: String?) -> String
    {
        var title = ""
        if projTitle == nil {
            title = AppData.curProject!.title
        }
        else
        {
            title = projTitle!
        }
        
        
        let imgData = shotImage.jpegData(compressionQuality: 1.0)
        
        
//        let imgUrl = ReadWrite.getNewImgeUrl(imgId: UUID().uuidString,
//                                             projectTitle: title)
        
        
        //        let fileUrl = projUrl.appendingPathComponent(fileName)
        
        
        
        let fileName = "\(title)_\(UUID().uuidString).jpg"
        let projUrl = getProjectUrl (title: title)
        
        let filePath = URL(fileURLWithPath: projUrl).appendingPathComponent(fileName)
        
        
        do {
            try imgData!.write(to: filePath)
            
        }
        catch
        {
            print(error.localizedDescription)
        }
        
        return fileName
    }
}
