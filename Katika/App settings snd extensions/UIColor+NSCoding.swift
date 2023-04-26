import UIKit

extension UIColor {
    class func color(withData data:Data) -> UIColor {
        do {
            let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIColor
//            let color = try NSKeyedUnarchiver.unarchivedObject(ofClasses: UIColor.self,
//                                                               from: data)
            return color ?? UIColor.blue
            
        } catch {
            print("Couldn't read file.")
        }
        
        return UIColor.blue
    }

    func encode() -> Data {
        do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: self, requiringSecureCoding: false)
            return data
        }
        catch
        {
            
        }
        return Data()
    }
}
