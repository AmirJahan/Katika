import UIKit

class ShotLength_VC: UIViewController, RangeSeekSliderDelegate
{
    @IBOutlet weak var lengthSlider: RangeSeekSlider!

    var currentStart: Float?
    var currentEnd: Float?
    var currentMax: Float?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        setupShotDurationSlider ()
    }
    
    func prepareShotRangeSliders ()
        {
    //        
        }
        
        func setupShotDurationSlider()
        {
            lengthSlider.minValue = 0.0
            lengthSlider.maxValue = CGFloat(currentMax!)
            lengthSlider.minDistance = 2.0
            lengthSlider.selectedMinValue = CGFloat(currentStart!)
            lengthSlider.selectedMaxValue = CGFloat(currentEnd!)

            lengthSlider.handleColor = .cyan
            lengthSlider.handleDiameter = 20.0
            lengthSlider.selectedHandleDiameterMultiplier = 1.1
        }
    
}
