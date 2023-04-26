import UIKit

extension Graphics_VC
{
    func snapshotCanvas ()
    {
        if let shotImage = captureCanvas (of: mainCanvas)
        {
            shot.artworkSet.img = shotImage
            
            ReadWrite.overwriteShotImage(shot)
           
//            shot.artworkSet.imgName = shot.imgName
            
            AppData.curProject?.projectImage = shotImage
            ReadWrite.overwriteProjectImage ()
        }
    }
}
