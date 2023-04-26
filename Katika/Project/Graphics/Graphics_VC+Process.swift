import Foundation




extension Graphics_VC
{


            func prepareProcess ()
            {
        Process.switchToStep(curStep: StepLongEnum.Graphics)
        
        ProcessSidebar_VC.addProcessTo (viewCtrl: self)
    }
}


extension Graphics_VC: SidebarProcessDelegate
{
    func popItOver()
    {
        ProcessPopover_VC.pop(on: self)
    }
}

extension Graphics_VC: ProcessNavigateDelegate
{
    func navigateToStep (processStep: ProcessStep)
    {
        // we shouldn't navigate if we are making a new suggestion
        if suggestionMode
        {
            return
        }
        NavigateProcess.toStep(step: processStep, from: self)
    }
}
