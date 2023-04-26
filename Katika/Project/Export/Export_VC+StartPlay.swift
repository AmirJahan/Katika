import UIKit

extension Export_VC
{
    func startPlay ()
    {
        playing = true
        playOrStopButton.setTitle("◼︎",
                                  for: UIControl.State.normal)
        play ()
    }
}
