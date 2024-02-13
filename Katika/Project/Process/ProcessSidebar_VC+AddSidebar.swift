import UIKit

extension ProcessSidebar_VC {
    // this is generic for all View Controllers
    class func addProcessTo(viewCtrl: UIViewController) {
        let processStoryboard = UIStoryboard(name: "Process",
                                             bundle: nil)
        let processController = processStoryboard.instantiateViewController(withIdentifier: "rootVc") as! ProcessSidebar_VC

        processController.processPopoverDelegate = viewCtrl as? SidebarProcessDelegate

        viewCtrl.addChild(processController)
        processController.view.translatesAutoresizingMaskIntoConstraints = false
        viewCtrl.view.addSubview(processController.view)

        let heightForSide = viewCtrl.view.bounds.height / 2.0

        NSLayoutConstraint.activate([
            processController.view.centerYAnchor.constraint(equalTo: viewCtrl.view.centerYAnchor),
            processController.view.trailingAnchor.constraint(equalTo: viewCtrl.view.trailingAnchor, constant: 0),
            processController.view.widthAnchor.constraint(equalToConstant: 32),
            processController.view.heightAnchor.constraint(equalToConstant: heightForSide)
        ])

        processController.didMove(toParent: viewCtrl)
    }
}
