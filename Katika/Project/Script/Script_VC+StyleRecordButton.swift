import UIKit

extension Script_VC
{
    // MARK: Audio Button
    func styleRecordButton ()
    {
        recordPauseButton.layer.borderWidth = 5.0
        recordPauseButton.layer.borderColor = UIColor.darkGray.cgColor
        recordPauseButton.layer.cornerRadius = recordPauseButton.layer.frame.size.width / 2.0
        recordPauseButton.clipsToBounds = true
        
        let internalLayer = CALayer()
        internalLayer.frame = recordPauseButton.bounds
        let newFrame = internalLayer.frame.insetBy(dx: internalLayer.frame.size.width / 8,
                                                   dy: internalLayer.frame.size.width / 8)
        internalLayer.frame = newFrame
        internalLayer.cornerRadius = internalLayer.frame.size.width / 2.0
        internalLayer.backgroundColor = UIColor.red.cgColor
        
        recordPauseButton.layer.addSublayer(internalLayer)
    }
    
    func buttonStoppedMode  ()
      {
          if ( recordPauseButton.layer.sublayers != nil)
          {
              let layer = recordPauseButton.layer.sublayers![0]
              UIView.animate(withDuration: 1.0)
              {
                  let buttonFrame = self.recordPauseButton.bounds
                  let newFrame = buttonFrame.insetBy(dx: buttonFrame.size.width / 8,
                                                     dy: buttonFrame.size.width / 8)
                  layer.frame = newFrame
                  layer.cornerRadius = layer.frame.size.width / 2.0
              }
          }
      }
    
    func  buttonRecordingMode()
    {
        if ( recordPauseButton.layer.sublayers != nil)
        {
            let layer = recordPauseButton.layer.sublayers![0]
            UIView.animate(withDuration: 1.0)
            {
                layer.frame = layer.frame.insetBy(dx: layer.frame.size.width / 4,
                                                  dy: layer.frame.size.width / 4)
                print(layer.frame)
                layer.cornerRadius = layer.frame.size.width / 4
            }
        }
    }
}
