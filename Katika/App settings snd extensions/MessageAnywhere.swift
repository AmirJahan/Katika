import UIKit

class MessageAnywhere {

    class func showMe(title: String, body: String) {
        //create an alert controller
        let pending = UIAlertController(title: title,
                                        message: body,
                                        preferredStyle: .alert)

        pending.addAction(UIAlertAction(title: "Ok",
                                        style: UIAlertAction.Style.default,
                                        handler: nil))

        topMostController()?.present(pending,
                                     animated: true,
                                     completion: nil)
    }

    class func topMostController() -> UIViewController? {
//        UIApplication.shared.windows.filter {$0.isKeyWindow}.first

        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first, let rootViewController = window.rootViewController else {
            return nil
        }

        var topController = rootViewController

        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }

        return topController
    }
}
