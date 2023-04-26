import UIKit


class MyClass: UIView
{
    class func instanceFromNib(nibName: String) -> UIView
    {
        return UINib(nibName: nibName,
                     bundle: nil).instantiate(withOwner: nil,
                                              options: nil)[0] as! UIView
    }
}


class Br_Summary_VC: UIViewController, UIScrollViewDelegate
{
    @IBAction func comeBackTo_Br_Summary(_ unwindSegue: UIStoryboardSegue) {}
    
    @IBOutlet weak var containerView: UIScrollView!
    @IBOutlet weak var mySeg: UISegmentedControl!

    
    @IBOutlet weak var continueButton: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        continueButton.isHidden = true
        
        // Do any additional setup after loading the view.
        
        containerView.delegate = self
        
        containerView.contentSize = CGSize(width: 512*5, height: 456)
        containerView.isPagingEnabled = true
        let nibNames = ["Br_Summary_Script", "Br_Summary_Shot", "Br_Summary_Graphics", "Br_Summary_Artworks", "Br_Summary_Edit"]
        
        for i in 0..<nibNames.count
        {
            let newView = MyClass.instanceFromNib(nibName: nibNames[i])
            newView.frame = CGRect(x: i * 512, y: 0, width: 512, height: 456)
            containerView.addSubview(newView)

        }
        
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        let page = Int (scrollView.contentOffset.x / 512)
        mySeg.selectedSegmentIndex = page
    }
    
    
    
    func loadNewView (nibName: String)
    {
        if containerView.subviews.count > 0
        {
            containerView.subviews[0].removeFromSuperview()
        }
        let editView = MyClass.instanceFromNib(nibName: nibName)
        containerView.addSubview(editView)
    }
    
    
    @IBAction func changeSlide (_ sender: UISegmentedControl)
    {
        let rect = CGRect(x: sender.selectedSegmentIndex * 512,
                          y: 0,
                          width: 512,
                          height: 456)
        
        containerView.scrollRectToVisible(rect, animated: true)
        
        
        if sender.selectedSegmentIndex == 4
        {
            continueButton.isHidden = false
        }
        
     }
    
    
    
    
    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
}
