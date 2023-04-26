import UIKit

class Tr_Graphics_Menu_VC: UIViewController
{
    @IBOutlet weak var shot1: UIButton!
    @IBOutlet weak var shot2: UIButton!
    @IBOutlet weak var shot3: UIButton!

    @IBAction func popBack ()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func unWind (_ seg: UIStoryboardSegue)
    {
        // empty func
    }
    
    @IBAction func shots (_ sender: UIButton)
    {
        performSegue(withIdentifier: "toTrGraphicsSegue",
                     sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier != "toTrGraphicsSegue"
        {
            return
        }
        
        let vc : Tr_Graphics_VC = segue.destination as! Tr_Graphics_VC
        
        if sender as? UIButton == shot1
        {
            
            let imgsArr = ["ShotPieces_bg.png",
                           "ShotPieces_one.png",
                           "ShotPieces_two.png",
                           "ShotPieces_three.png",
                           "ShotPieces_four.png",
                           "ShotPieces_five.png"]
            
            vc.imgsArr = imgsArr
            
        }
        
        if sender as? UIButton == shot2
        {
            
            let imgsArr = ["ShotPieces_bg_2.png",
                           "ShotPieces_one_2.png",
                           "ShotPieces_two_2.png",
                           "ShotPieces_three_2.png",
                           "ShotPieces_four_2.png",
                           "ShotPieces_five_2.png"]
            
            vc.imgsArr = imgsArr
            
        }
        
        if sender as? UIButton == shot3
        {
            
            let imgsArr = ["ShotPieces_bg_3.png",
                           "ShotPieces_one_3.png",
                           "ShotPieces_two_3.png",
                           "ShotPieces_three_3.png",
                           "ShotPieces_four_3.png",
                           "ShotPieces_five_3.png"]
            
            vc.imgsArr = imgsArr
        }
    }
    
}
