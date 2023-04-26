import Foundation

protocol SuggestionDelegate
{
    func makeSuggestion ()
    
    func makeMainArtworks (suggestionIndex: Int)
    
    func updateSuggestionsBadge ()
}
