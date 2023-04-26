import UIKit

extension Graphics_VC: SuggestionDelegate
{
    func makeSuggestion ()
    {
        suggestShot ()
    }
    
    
    
    func updateSuggestionsBadge()
    {
        loadSuggestions ()
    }
    
    func makeMainArtworks(suggestionIndex: Int)
    {
        clearSelection ()
        removeAllGestures()
        snapshotCanvas ()
        

        // save the current shot
        AppData.curProject!.shots[shotIndex] = shot
        
        clearCanvas ()
        
        
        let suggestion = shot.suggestions[suggestionIndex]
        
        let currentArtworkSet = shot.artworkSet
        
        shot.suggestions.remove(at: suggestionIndex)
        
        shot.suggestions.append(currentArtworkSet)
        
        shot.artworkSet = suggestion
        
        
        updateBackgroundColor(with: shot.artworkSet.bgColor)
        
        loadArtworks()
        
        MakeFrames.makeAllFrames(shot: shot, transitionLength: 0.0)

    }
}
