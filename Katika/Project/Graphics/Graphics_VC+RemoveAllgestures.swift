extension Graphics_VC
{
    
    
    
    func removeAllGestures ()
    {
        for artwork in shot.artworkSet.artworks
        {
            removeGesturesFromArtwork(artwork: artwork)
        }
    }
}
