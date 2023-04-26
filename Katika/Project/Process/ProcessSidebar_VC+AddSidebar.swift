import UIKit

extension ProcessSidebar_VC
{
    // this is generic for all View Controllers
    class func addProcessTo  (viewCtrl: UIViewController)
    {
        let processStoryboard = UIStoryboard(name: "Process",
                                             bundle: nil)
        let processController = processStoryboard.instantiateViewController(withIdentifier: "rootVc") as! ProcessSidebar_VC
        
        
        
        
//        processController.processDelegate = viewCtrl as? ProcessDelegate
        processController.processPopoverDelegate = viewCtrl as? SidebarProcessDelegate
        
        viewCtrl.addChild(processController)
        processController.view.translatesAutoresizingMaskIntoConstraints = false
        viewCtrl.view.addSubview(processController.view)
        
//        processController.view.layer.masksToBounds = false
//        processController.view.layer.shadowRadius = 0
//        processController.view.layer.shadowOpacity = 1
//        processController.view.layer.shadowColor = UIColor.lightGray.cgColor
//        processController.view.layer.shadowOffset = CGSize(width: -1 , height:0)
        
        
        let heightForSide = viewCtrl.view.bounds.height / 2.0
        
        NSLayoutConstraint.activate([
            //                controller.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,
            //                                                         constant: 0),
            processController.view.centerYAnchor.constraint(equalTo: viewCtrl.view.centerYAnchor),
            processController.view.trailingAnchor.constraint(equalTo: viewCtrl.view.trailingAnchor, constant: 0),
//            processController.view.topAnchor.constraint(equalTo: viewCtrl.view.topAnchor, constant: 0),
//            processController.view.bottomAnchor.constraint(equalTo: viewCtrl.view.bottomAnchor, constant: 0),
            processController.view.widthAnchor.constraint(equalToConstant: 32),
            processController.view.heightAnchor.constraint(equalToConstant: heightForSide)
        ])
        
        
//        let tapGesture = UITapGestureRecognizer(target: self,
//                                                action: #selector(tappedView))
//
//        processController.view.addGestureRecognizer(tapGesture)
        
        processController.didMove(toParent: viewCtrl)
    }
    
    
//    @objc func tappedView ()
//    {
//        print ("tapped")
//    }
}
