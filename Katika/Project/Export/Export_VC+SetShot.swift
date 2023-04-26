import UIKit

extension Export_VC
{
    func setShot (animated: Bool)
    {
        guard let curShot = AppData.curProject?.shots[curShotIndex] else { return }
        
        nextShotTime = curShot.startTime! + curShot.duration!

        let shotCanvas : UIView = UIView(frame: mainCanvas.bounds)
        
        if animated
        {
            transition (canvas: shotCanvas)
        }
        
        // load shot artworks
        shotCanvas.backgroundColor = curShot.bgColor
        loadArtworks(shot: curShot,
                     into: shotCanvas)
        
        shotCanvas.clipsToBounds = true
        
        
        // make all the frames
        MakeFrames.makeAllFrames(shot: curShot,
                                 transitionLength: transitionTime)

        
        self.mainCanvas.addSubview(shotCanvas)
    } 
}
