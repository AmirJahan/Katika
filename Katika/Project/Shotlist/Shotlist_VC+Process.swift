import UIKit

extension Shotlist_VC
{
    func prepareProcess ()
    {
        shotsCollectionView.reloadData()

        Process.switchToStep(curStep: StepLongEnum.Shotlist)
        
        ProcessSidebar_VC.addProcessTo (viewCtrl: self)
    }
}

extension Shotlist_VC: SidebarProcessDelegate
{
    func popItOver()
    {
        ProcessPopover_VC.pop(on: self)
    }
}

extension Shotlist_VC: ProcessNavigateDelegate
{
    func navigateToStep (processStep: ProcessStep)
    {
        if textEditingMode
        {
            youAreInEditMode()
            
            return
        }
        
        saveShots ()
        NavigateProcess.toStep(step: processStep, from: self)
    }
}
