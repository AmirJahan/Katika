import UIKit

class Tr_Graphics_VC: UIViewController
{
    @IBAction func comeBackTo_Tr_Graphics(_ unwindSegue: UIStoryboardSegue) {}

    
    @IBOutlet weak var mainText: UITextView!
    
    @IBOutlet  var sliders: [UISlider]!
    @IBOutlet weak var breakOrAssembleButton: UIButton!
    @IBOutlet  var notes: [UITextView]!
    
    
    @IBOutlet weak var continueButton: UIButton!

    
    
    var breakMode = false
    
    
    @IBOutlet weak var canvas: UIView!
    
    var imgsArr : [String]?
    
 
    
    
    var center : CGPoint!
    var imageViewArr : [UIImageView] = []
    
    var myPanGesture: UIPanGestureRecognizer!
    
    var viewRotated = false
    
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        
        continueButton.isHidden = true
        continueButton.alpha = 0.0


        if let num = imgsArr?.count
        {
        mainText.text = "Here, we break a shot apart to view its building blocks. This shot is made of \(num) layers that are placed over one another."
        }
        
        center = canvas.center
        canvas.backgroundColor = .clear
        canvas.layer.borderColor = UIColor.darkGray.cgColor
        canvas.layer.borderWidth = 0.5
        
        
        
        // this to make sure at the beginning we
        // hide everyting and end up in the non break mode
        breakMode = true
        breakOrAssemble ()
        
        
        makeTheShot()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
              
        
        myPanGesture = UIPanGestureRecognizer(target: self,
                                              action: #selector (rotateViews))
        self.canvas.addGestureRecognizer(myPanGesture)
        
        sliders[1].maximumValue = Float(imgsArr!.count - 1)
        sliders[1].minimumValue = 0
        
    }
    
    
    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
}



