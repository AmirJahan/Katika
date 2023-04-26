import UIKit


extension Export_VC
{
    func prepareProcess ()
    {
        Process.switchToStep(curStep: StepLongEnum.Export)
        
        ProcessSidebar_VC.addProcessTo (viewCtrl: self)
    }
}


extension Export_VC: SidebarProcessDelegate
{
    func popItOver()
    {
        ProcessPopover_VC.pop(on: self)
    }
}

extension Export_VC: ProcessNavigateDelegate
{
    func navigateToStep (processStep: ProcessStep)
    {
        NavigateProcess.toStep(step: processStep, from: self)
    }
}
