import UIKit

extension Shotlist_VC
{
    func makeShots ()
    {
        // for now, if shots have been built before, then, we won't re-create them
        
        guard let project = AppData.curProject else { return }
        
        if project.shots.count == 0 || AppData.curProject!.scriptChanged
        {
            //        AppData.curProject!.shots.removeAll()
            let arrayOfSentences = splitScript(script: AppData.curProject?.script ?? "")
            
            
            for i in 0..<arrayOfSentences.count
            {
                let randomColor = UIColor.random
                let img = UIImage.imageWithColor(color: randomColor)
                let newShot = Shot(number: i,
                                   script: arrayOfSentences[i],
                                   scriptWords: [],
                                   duration: nil,
                                   startTime: nil,
//                                   imgName: ReadWrite.saveImageAndGetName(img, nil),
                                   bgColor: randomColor)
                
                
                let imgName = ReadWrite.saveImageAndGetName(img, nil)
                
                newShot.artworkSet.imgName = imgName
//newShot.artworkSet.imgName = newShot.imgName

                
                AppData.curProject?.shots.append(newShot)
            }
            
            makeShotsDurations()
            
            shotsCollectionView.reloadData()
            
            saveShots ()
        }
    }
    
    func makeShotsDurations ()
    {
        guard let shots = AppData.curProject?.shots else { return }
        guard let length = AppData.curProject?.length else { return }
        
        let count = shots.count
        let defDuration = length / Float (count)
        
        for i in 0..<count
        {
            let shot = shots[i]
            shot.startTime = defDuration * Float(i)
            shot.duration = defDuration
        }
        
    }
}
