import UIKit

extension Graphics_VC
{
    func addEmbeddedShots ()
    {
        let embedShotsSb = UIStoryboard(name: "ShotsEmbedded",
                                        bundle: nil)
        embeddedShotsVc = embedShotsSb.instantiateViewController(withIdentifier: "rootVc") as? ShotsEmbedded_VC
        
        embeddedShotsVc!.currentShot = shotIndex
        
        embeddedShotsVc!.delegate = self as EmbeddedShotsDelegate
        
        self.addChild(embeddedShotsVc!)
        embeddedShotsVc!.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(embeddedShotsVc!.view)
        
        
        setConstraints (at: 56)
    }
    
    
}

extension Graphics_VC
{
    func setConstraints (at bottom: Int)
    {
        let width = AppData.curProject!.shots.count * 64
        
        
        let heightConst = NSLayoutConstraint(item: embeddedShotsVc!.view!,
                                             attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil,
                                             attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1,
                                             constant: 100)
        
        
        bottomConstraint =
            NSLayoutConstraint(item: embeddedShotsVc!.view!,
                               attribute: NSLayoutConstraint.Attribute.bottom,
                               relatedBy: NSLayoutConstraint.Relation.equal,
                               toItem: self.view,
                               attribute: NSLayoutConstraint.Attribute.bottom,
                               multiplier: 1,
                               constant: CGFloat(bottom))
        
        
        
        NSLayoutConstraint.activate([
            //                controller.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
            //                                                         constant: 0),
            embeddedShotsVc!.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            bottomConstraint,
            //            shotsVc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            //            processController.view.topAnchor.constraint(equalTo: viewCtrl.view.topAnchor, constant: 0),
            
            embeddedShotsVc!.view.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            heightConst
        ])
        embeddedShotsVc!.didMove(toParent: self)
    }
}





extension Graphics_VC: EmbeddedShotsDelegate
{
    func changeShot(index: Int)
    {
        stop ()
        clearSelection ()
        readyShotForSave ()
        ReadWrite.write()

        removeAllGestures()
        clearCanvas ()
        
        
        initialCenter = CGPoint()
        animationMode = false
        addTextMode = true
        suggestionMode = false
        
        player = nil
        playMode = false
        
        playTime = 0.0
        
        playTimer = nil
        
        embeddedShotsVc!.view.removeFromSuperview()
        embeddedShotsVc?.removeFromParent()
        embeddedShotsVc = nil
        
        bottomConstraint = nil
        
        shotIndex = index
        
        
        loadShotAtViewDidLoad ()
        loadShotAtViewWillAppear()
    }
    
    func changeHeight(height: Int)
    {
        UIView.animate(withDuration: 0.4)
        {
            self.bottomConstraint.constant = CGFloat(height)
            self.view.layoutIfNeeded()
        }
    }
}
