import UIKit

extension Shotlist_VC
{
    @IBAction func shotlistIsReady ()
    {
        let next = Process.export
        NavigateProcess.toProcess(to: next, from: self)
    }
}
