import UIKit

extension Script_VC
{
    @IBAction func scriptIsReady ()
    {
        stopPlayBack ()
        saveScript()
        
        let next = Process.shotlist
        NavigateProcess.toProcess(to: next, from: self)
    }
}
