import UIKit

extension Export_VC
{
//    func prepareHelpButton ()
//    {
//        helpBarButton = UIBarButtonItem(title: "Help",
//                                        style: .plain,
//                                        target: self,
//                                        action: #selector(helpFunction))
//
//        self.navigationItem.rightBarButtonItems = [helpBarButton]
//    }
    
@IBAction func helpFunction (_ sender: UIButton)
{
    let step = Process.export
    Help_VC.popoverHelp(to: self,
                        at: sender,
                        for: step)
}
}


extension Export_VC: HelpDelegate
{
    func navigateToTraining(training: TrainingStep)
    {
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
