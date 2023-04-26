import Foundation

extension Graphics_VC
{
    func readyShotForSave ()
    {
        removeAllGestures()
        clearSelection()
       
        snapshotCanvas ()
        
        updateArtworkAssets()
        
        shot.artworkSet.bgColor = mainCanvas.backgroundColor!
        
        AppData.curProject!.shots[shotIndex] = shot
    }
}
