import UIKit

class Tr_Shotlist_VC: UIViewController
{
    
    @IBOutlet weak var mainTitle: UITextView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setMainTitle ()
    }
    
    func setMainTitle ()
        {
            let storyboardName: String = self.storyboard?.value(forKey: "name") as! String
            
            mainTitle.text = TrainingData.fetchTitle(sbName: storyboardName)
            
    //        for training in TrainingData.trainings
    //        {
    //            if training.sb == storyboardName
    //            {
    //                mainTitle.text = training.txt
    //                break
    //            }
    //        }
        }
        
    
    @IBAction func goBack (_ sender: UIButton)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
