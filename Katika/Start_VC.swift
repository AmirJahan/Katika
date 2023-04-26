import UIKit

class Start_VC: UIViewController
{
    @IBOutlet weak var progressView: UIProgressView!
    var progressTimer : Timer? = nil
    var progress : Float = 0.0
    let waitTime: Float = 2.0
    let interval: Float = 0.05
    var progressStep: Float? = nil
    

    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }


    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
//        self.navigationController?.navigationBar.isHidden = true
//        self.title = "Home"
        
        progressStep = interval / waitTime
        
        // TODO: This code has to be re-written based on the actual projects
        progressView.progress = progress

        
        // these are background work
        AssetsData.fetchAssets()
    }

    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        
        progressTimer = Timer.scheduledTimer(timeInterval: TimeInterval(interval),
                                             target: self,
                                             selector: #selector(progressChecker),
                                             userInfo: nil,
                                             repeats: true)
    }
    
    @objc
    func progressChecker ()
    {
        if (progress < 1.0)
        {
            progress += 0.025
            progressView.progress = progress
        }
        else
        {
            progressTimer?.invalidate()

                self.performSegue(withIdentifier: "mainNavigationSegue",
                                  sender: nil)
        }
    }
    
}
