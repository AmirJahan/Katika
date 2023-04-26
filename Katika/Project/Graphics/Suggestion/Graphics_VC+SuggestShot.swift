import UIKit

extension Graphics_VC
{
    func suggestShot ()
    {
        suggestionMode = true
        endSuggestionsButton.isHidden = false
        suggestionsCommentTextField.isHidden = false
        popBackButton.isHidden = true
        
        
        clearSelection ()
        removeAllGestures()
        
        // update shot and project images
        snapshotCanvas ()
        
        ReadWrite.write()
        clearCanvas ()
        
        
        // we make the img with the background color of the
        // original shot
        //        let img = UIImage.imageWithColor(color: shot.bgColor)
        
        
        // because we work on Shot Graphics, we have tp store the
        // current ones somewhere
        
        shot.artworkSet.bgColor = mainCanvas.backgroundColor!
        shot.suggestions.append(shot.artworkSet)
        
        // let's empty Shot Artworks
        shot.artworkSet = ArtworkSet(author: AppData.user)
    }
}

