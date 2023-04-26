import UIKit

extension Script_VC
{
    func prepareProcess ()
    {
        Process.switchToStep(curStep: StepLongEnum.Script)
        
        ProcessSidebar_VC.addProcessTo (viewCtrl: self)
    }
}

extension Script_VC: SidebarProcessDelegate
{
    func popItOver()
    {
        ProcessPopover_VC.pop(on: self)
    }
}

extension Script_VC: ProcessNavigateDelegate
{
    func navigateToStep (processStep: ProcessStep)
    {
        saveScript ()
        NavigateProcess.toStep(step: processStep, from: self)
    }
}
