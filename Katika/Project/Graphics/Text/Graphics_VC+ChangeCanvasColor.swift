import UIKit

extension Graphics_VC
{
    @IBAction func changeBgColor (_ sender: UIButton)
    {
        clearSelection()
        let storyboard = UIStoryboard(name: "ColorPicker",
                                      bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "rootVc") as! PopoverColorPicker
        vc.colorDelegate = self
        
        vc.startColor = mainCanvas.backgroundColor!
        
        vc.preferredContentSize = CGSize(width: 256,
                                         height: 256)
        
        vc.modalPresentationStyle = .popover
        if let pres = vc.presentationController
        {
            pres.delegate = self
        }
        self.present(vc, animated: true)
        if let pop = vc.popoverPresentationController
        {
            pop.sourceView = (sender as UIView)
            pop.sourceRect = (sender as UIView).bounds
        }
    }
}



extension Graphics_VC : UIPopoverPresentationControllerDelegate
{
    func adaptivePresentationStyle(for controller: UIPresentationController,
                                   traitCollection: UITraitCollection) -> UIModalPresentationStyle
    {
        return .none
    }
}







extension Graphics_VC: ColorPickerDelegate
{
    func newColorIs(color: UIColor)
    {
        if selected == nil
        {
            shot.bgColor = color
            updateBackgroundColor (with: color)
        }
    }
}

extension Graphics_VC
{
    func updateBackgroundColor (with color: UIColor)
    {
        mainCanvas.backgroundColor = color
        bgColorPicker.backgroundColor = color
    }
}
