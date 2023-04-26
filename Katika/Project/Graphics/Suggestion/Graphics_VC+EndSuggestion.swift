import UIKit

extension Graphics_VC
{
    @IBAction func endSuggestion ()
    {
        // out of suggestions
        suggestionMode = false
        endSuggestionsButton.isHidden = true
        suggestionsCommentTextField.isHidden = true
        popBackButton.isHidden = false
        
        // let's clear canvas
        clearSelection ()
        removeAllGestures()
        
        let currentShotGraphics = shot.suggestions.last
        
        shot.suggestions.removeLast()
        
        
        guard let suggestionImage = captureCanvas (of: mainCanvas) else { return }
        
        // we now hove an image of the shot
        
        let imgName = ReadWrite.saveImageAndGetName(suggestionImage,
                                                    nil)
        
        //        let newSuggestion = shot.artworkSet
        
        let newArtworkSet = ArtworkSet(author: AppData.user)
        
        newArtworkSet.comment = suggestionsCommentTextField.text ?? "No Comment Entered"
        newArtworkSet.bgColor = mainCanvas.backgroundColor!
        newArtworkSet.artworks = shot.artworkSet.artworks
        newArtworkSet.imgName = imgName
        
        newArtworkSet.img = suggestionImage


        
        shot.suggestions.append(newArtworkSet)
        
        shot.artworkSet = currentShotGraphics!
        mainCanvas.backgroundColor = shot.bgColor
        
        // make App data the same
        AppData.curProject!.shots[shotIndex] = shot
        
        ReadWrite.write()
        
        
        suggestionsCommentTextField.text = ""
        
        
        let alrt = UIAlertController(title: "Done",
                                     message: "Suggestion was succesfuly saved", preferredStyle: UIAlertController.Style.alert)
        
        alrt.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { (alert) in
            
            self.loadSuggestions ()
            
            
            
            self.refreshScene ()
            
            self.loadArtworks()
            self.updateBackgroundColor(with: self.shot.artworkSet.bgColor)
            
            
        }))
        
        
        self.present(alrt, animated: true, completion: nil)
        
    }
}

