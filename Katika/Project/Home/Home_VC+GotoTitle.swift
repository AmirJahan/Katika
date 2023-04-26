
import UIKit
extension Home_VC
{
    func gotoScript (_ proj: Project?)
    {

        if let project = proj
        {
            AppData.curProject = project
        }
                
        let titleProcess = Process.script
        NavigateProcess.toStep(step: titleProcess,
                               from: self)
    }
    
    @IBAction func newProjectAction (_ sender: UIButton)
    {
        gotoScript (nil)
    }
}
