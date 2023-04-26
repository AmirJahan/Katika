import UIKit

extension ReadWrite
{
    class func imageForName ( _ projectTitle: String,
                             _ name: String) -> UIImage?
    {
        let projUrl = getProjectUrl (title: projectTitle)
               //        let fileUrl = projUrl.appendingPathComponent(fileName)
               
               
               
//               let fileName = "\(projectTitle)_\(name).jpg"
               
               let imgUrl = URL(fileURLWithPath: projUrl).appendingPathComponent(name)
        
//        let imgUrl =
        
        
        guard let data = try? Data(contentsOf: imgUrl) else {return nil}
//    print ("data found :\(data)")
        guard let image = UIImage(data: data) else {return nil}
//        print ("image made:\(image)")

        
        return image
    }
}
