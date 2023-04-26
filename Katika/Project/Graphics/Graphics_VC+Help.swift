import UIKit

extension Graphics_VC
{
    @IBAction func helpFunction (_ sender: UIButton)
    {
        let step = Process.graphics
        Help_VC.popoverHelp(to: self,
                            at: sender,
                            for: step)
    }
    
    // YOU SHOUDL INCLUDE newSuggestionOn
    
    
//    func prepareHelpButton ()
//    {
//        helpBarButton = UIBarButtonItem(title: "Help",
//                                        style: .plain,
//                                        target: self,
//                                        action: #selector(helpFunction))
//        
//        self.navigationItem.rightBarButtonItems = [helpBarButton]
//    }
//    
//    @objc func helpFunction ()
//    {
//        let step = Process.graphics
//        Help_VC.popoverHelp(to: self, at: helpBarButton, for: step)
//    }
}


extension Graphics_VC: HelpDelegate
{
    func navigateToTraining(training: TrainingStep)
    {
        // dismiss the help menu
        self.dismiss(animated: true, completion: nil)
        
                  
                  let storyBoard = training.storyboard
                  let id =  training.vcId

                  let storyboard = UIStoryboard(name: storyBoard,
                                                bundle: nil)
                  let popover = storyboard.instantiateViewController(withIdentifier: id)
           
                  
                  let popoverSize = self.view.bounds.insetBy(dx: 64, dy: 64)
                  
                  popover.preferredContentSize = popoverSize.size
                  popover.modalPresentationStyle = .popover
                  if let presentation = popover.popoverPresentationController
                  {
                      presentation.sourceRect = CGRect(x: view.center.x,
                                                       y: view.center.y,
                                                       width: 0,
                                                       height: 0)
                      presentation.sourceView = view
                      presentation.permittedArrowDirections = UIPopoverArrowDirection(rawValue: 0)
                      

                  }
                  self.present(popover,
                                   animated: true,
                                   completion: nil)
    }
}
