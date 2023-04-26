import UIKit

extension Graphics_VC
{
    @IBAction func animate (_ sender: UIButton)
    {
        
        setAnimationMode ()
    }
    
    func setAnimationMode ()
    {
        if !animationMode
        {
            // go to animate mode
            positionKeyframeButton.isHidden = false
            rotationKeyframeButton.isHidden = false
            scaleKeyframeButton.isHidden = false
            alphaKeyframeButton.isHidden = false
            
            deletePositionKeyframeButton.isHidden = false
             deleteRotationKeyframeButton.isHidden = false
             deleteScaleKeyframeButton.isHidden = false
             deleteAlphaKeyframeButton.isHidden = false
            
            
            
            animationMode = true
            animateButton.backgroundColor = .systemRed
            mainCanvas.layer.borderWidth = 1.5
            mainCanvas.layer.borderColor = UIColor.systemRed.cgColor
            
        }
        else
        {
            // come out of animate mode
            positionKeyframeButton.isHidden = true
            rotationKeyframeButton.isHidden = true
            scaleKeyframeButton.isHidden = true
            alphaKeyframeButton.isHidden = true
            
            deletePositionKeyframeButton.isHidden = true
             deleteRotationKeyframeButton.isHidden = true
             deleteScaleKeyframeButton.isHidden = true
             deleteAlphaKeyframeButton.isHidden = true

            animationMode = false
            animateButton.backgroundColor = .primary
            mainCanvas.layer.borderWidth = 0.5
            mainCanvas.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
}
