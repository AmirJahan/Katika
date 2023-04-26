import UIKit

class BusyView: UIView {
    @IBOutlet weak var content : UIView!
//    @IBOutlet weak var warningLabel : UILabel!
//    @IBOutlet weak var activityIndicatorView : UIActivityIndicatorView!
    
    
    // initialize using storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup ()
    }
    
    func setup() {
        Bundle.main.loadNibNamed("BusyView",
                                 owner: self,
                                 options: nil)
        
        addSubview(content)
        content.frame = self.bounds
    }
    
    // init using Code
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup ()
    }
}
